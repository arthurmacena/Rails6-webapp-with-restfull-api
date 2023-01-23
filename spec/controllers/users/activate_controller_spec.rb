# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::ActivateController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'unauthenticated user' do
    login_user_user

    describe 'ACTIVATE #activate with a not admin user' do
      it 'does not activate a User in the database' do
        user = FactoryBot.create(:user, status: 'inactive')
        post :create, params: { user_id: user.id }
        user.reload
        expect(user.status).to eq('inactive')
      end
    end
  end

  describe 'authenticated user' do
    login_user_admin

    describe 'ACTIVATE #activate with an admin user' do
      it 'activate a User in the database' do
        user = FactoryBot.create(:user, status: 'inactive')
        post :create, params: { user_id: user.id }
        user.reload
        expect(user.status).to eq('active')
      end
    end
  end
end