class Users::InactivateController < ApplicationController
  def create
    authorize %i[users inactivate]
    user = User.find params[:user_id]
    user.inactive!
    redirect_to(root_path, notice: "Usuário #{user.email} ativado com sucesso.")
  end
end
