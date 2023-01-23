# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users api', type: :request do
  let(:user) { create(:user) }

  let(:valid_user_email) do
    { email: "test@example.com" }.to_json
  end
  let(:invalid_user_email) do
    { email: "test@" }.to_json
  end


  let(:new_user_attributes) { attributes_for(:user) }
  let(:valid_create_params) do
    {
      'email' => new_user_attributes[:email],
      'password' => new_user_attributes[:password]
    }.to_json
  end
  let(:invalid_create_params) do
    {
      'email' => '',
      'password' => new_user_attributes[:password]
    }.to_json
  end

  let(:headers) do
    {
      'Content-Type' => 'application/json'
    }
  end

  describe 'GET /users' do
    it 'renders a successful response' do
      get "/api/v1/users", params: {}, headers: headers
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /users' do
    it 'renders a successful response' do
      post '/api/v1/users', params: valid_create_params, headers: headers
      expect(response).to have_http_status(:created)
    end

    it 'renders a not successful response' do
      post '/api/v1/users', params: invalid_create_params, headers: headers
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'PUT /users' do
    it 'renders a successful response' do
      put "/api/v1/users/#{user.id}", params: valid_user_email, headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'renders a not successful response' do
      put "/api/v1/users/#{user.id}", params: invalid_user_email, headers: headers
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'DELETE /users' do
    it 'renders a successful response' do
      delete "/api/v1/users/#{user.id}", params: valid_user_email, headers: headers
      expect(response).to have_http_status(:ok)
    end

    it 'renders a not successful response' do
      delete "/api/v1/users/", headers: headers
      expect(response).to have_http_status(:method_not_allowed)
    end
  end
end
