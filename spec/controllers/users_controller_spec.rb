# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'unauthenticated admin' do

    describe 'GET #index' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe 'GET #show' do
      it 'redirects to login page' do
        get :show, params: { id: user }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe 'GET #new' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe 'GET #edit' do
      it 'redirects to login page' do
        get :edit, params: { id: user }
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe 'POST #create' do
      let(:valid_data) { FactoryBot.attributes_for(:user) }

      it 'redirects to login page' do
        post :create, params: { user: valid_data }
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'authenticated user' do
    login_user_user
    let(:new_user) { FactoryBot.create(:user) }

    describe 'GET #index' do
      it 'renders :index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe 'GET #show' do
      it 'renders show template' do
        get :show, params: { id: user }
        expect(response).to render_template(:show)
      end

      it 'assigns requested User' do
        get :show, params: { id: user }
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'GET #new' do
      it 'renders :new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      it 'renders :edit template' do
        get :edit, params: { id: user }
        expect(response).to render_template(:edit)
      end

      it 'assigns the requested User to template' do
        get :edit, params: { id: user }
        expect(assigns(:user)).to eq(user)
      end
    end

    describe 'POST #create' do
      context 'with valid data' do
        let(:valid_data) { FactoryBot.attributes_for(:user) }

        it 'redirects to users#index' do
          post :create, params: { user: valid_data }
          expect(response).to redirect_to(User.last)
        end

        it 'creates new User in the database' do
          expect do
            post :create, params: { user: valid_data }
          end.to change(User, :count).by(1)
        end
      end

      context 'with invalid data' do
        let(:invalid_data) { FactoryBot.attributes_for(:user, email: '') }

        it 'renders :new template' do
          post :create, params: { user: invalid_data }
          expect(response).to render_template(:new)
        end

        it 'does not create a new User in the database' do
          expect do
            post :create, params: { user: invalid_data }
          end.not_to change(User, :count)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid data' do
        let(:valid_data) { FactoryBot.attributes_for(:user, email: 'test@example.com') }

        it 'redirects to users#index index page' do
          put :update, params: { id: user, user: valid_data }
          expect(response).to redirect_to(user)
        end

        it 'updates User in the database' do
          put :update, params: { id: user, user: valid_data }
          user.reload
          expect(user.email).to eq('test@example.com')
        end
      end

      context 'with invalid data' do
        let(:invalid_data) { FactoryBot.attributes_for(:user, email: '') }

        it 'renders :edit template' do
          put :update, params: { id: user, user: invalid_data }
          expect(response).to render_template(:edit)
        end

        it 'does not update User in the database' do
          put :update, params: { id: user, user: invalid_data }
          user.reload
          expect(user.email).not_to eq('')
        end
      end
    end

    describe 'DELETE #destroy with an not admin user' do
      it 'does not delete a User in the database' do
        user = FactoryBot.create(:user)
        expect do
          delete :destroy, params: { id: user }
        end.to change(User, :count).by(0)
      end
    end
  end

  describe 'authenticated user admin' do
    login_user_admin

    describe 'DELETE #destroy with an admin user' do
      it 'delete a User in the database' do
        user = FactoryBot.create(:user)
        expect do
          delete :destroy, params: { id: user }
        end.to change(User, :count).by(-1)
      end
    end
  end
end
