# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe 'unauthenticated user' do
    describe 'GET #index' do
      it "returns to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end

  describe 'authenticated user' do
    login_user_user
    describe 'GET #index' do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end