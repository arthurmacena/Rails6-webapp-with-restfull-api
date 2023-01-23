class HomePolicy < ApplicationPolicy

  def index?
    true
  end

  class Scope < Scope; end
end
