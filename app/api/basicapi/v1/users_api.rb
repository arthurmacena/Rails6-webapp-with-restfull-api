# frozen_string_literal: true

module Basicapi
  module V1
    class UsersAPI < Grape::API
      resource :users do

        # GET /api/v1/users/hello
        desc 'Hello Users'
        get :hello do
          { data: 'Hello from the users' }
        end

        # GET /api/v1/users
        desc 'List Users'
        params do
          optional :id, type: String, desc: "User's id."
          optional :email, type: String, desc: "User's email."
          optional :status, type: String, desc: "User's status."
        end
        get do
          users = User.all
          users = users.where(id: params[:id]) if params[:id].present?
          users = users.where(email: params[:email]) if params[:email].present?
          users = users.where(status: params[:status]) if params[:status].present?

          present users, with: Basicapi::Entities::UserEntity
        end

        # POST /api/v1/users
        desc 'Create Users'
        params do
          requires :email, type: String, desc: "User's email."
          requires :password, type: String, desc: "User's password."
          optional :role, type: String, desc: "User's role."
          optional :status, type: String, desc: "User's status."
        end
        post do
          user = User.new(email: params[:email], password: params[:password])
          user.role = params[:role] if params[:role].present?
          user.status = params[:status] if params[:status].present?
          user.save!

          present user, with: Basicapi::Entities::UserEntity
        rescue ActiveRecord::RecordNotFound => e
          error!({ error: { message: "404 Not Found - #{e.message}" } }, 404)
        rescue StandardError => e
          error!({ error: { message: "400 Bad Request - #{e.message}" } }, 400)
        end

        # PUT /api/v1/users
        desc 'Update Users'
        params do
          optional :email, type: String, desc: "User's email."
          optional :status, type: String, desc: "User's status."
        end
        route_param :id do
          put do
            user = User.find(params[:id])
            user.update!(email: params[:email]) if params[:email].present?
            user.update!(status: params[:status]) if params[:status].present?

            present user, with: Basicapi::Entities::UserEntity
          rescue ActiveRecord::RecordNotFound => e
            error!({ error: { message: "404 Not Found - #{e.message}" } }, 404)
          rescue StandardError => e
            error!({ error: { message: "400 Bad Request - #{e.message}" } }, 400)
          end
        end

        # DELETE /api/v1/users
        desc 'Delete Users'
        route_param :id do
          delete do
            user = User.find(params[:id])
            user.delete

            status 200
          rescue ActiveRecord::RecordNotFound => e
            error!({ error: { message: "404 Not Found - #{e.message}" } }, 404)
          rescue StandardError => e
            error!({ error: { message: "400 Bad Request - #{e.message}" } }, 400)
          end
        end
      end
    end
  end
end