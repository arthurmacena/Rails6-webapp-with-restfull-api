# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::InactivateController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'unauthenticated user' do
    login_user_user
    describe 'INACTIVATE #inactivate with a not admin user' do
      it 'does not inactivate a User in the database' do
        user = FactoryBot.create(:user, status: 'active')
        post :create, params: { user_id: user.id }
        user.reload
        expect(user.status).to eq('active')
      end
    end
  end

  describe 'authenticated user' do
    login_user_admin

    describe 'INACTIVATE #inactivate with an admin user' do
      it 'inactivate a User in the database' do
        user = FactoryBot.create(:user, status: 'active')
        post :create, params: { user_id: user.id }
        user.reload
        expect(user.status).to eq('inactive')
      end
    end
  end
end
