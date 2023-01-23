class Users::InactivatePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
