class Users::ActivatePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
