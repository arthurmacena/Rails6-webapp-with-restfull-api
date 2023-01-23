class Users::ActivateController < ApplicationController
	def create
		authorize %i[users activate]
    user = User.find params[:user_id]
    user.active!
    redirect_to(root_path, notice: "Usuário #{user.email} ativado com sucesso.")
  end
end
