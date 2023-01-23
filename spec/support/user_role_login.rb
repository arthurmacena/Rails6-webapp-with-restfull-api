# frozen_string_literal: true

module UserRolesLogin
  def login_user_admin
    before do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:user_admin)
    end
  end

  def login_user_user
    before do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:user)
    end
  end
end
