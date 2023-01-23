class HomeController < ApplicationController
  def index
    authorize %i[home]
  end
end
