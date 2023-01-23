# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'System admin <systemadmin@example.com>'

  def welcome_email
    @user = User.find(params[:user_id])

    return unless @user.email.match(/\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]*[a-zA-Z0-9]+\z/)

    @user.save(validate: false)

    mail to: @user.email, subject: 'Bem-Vindo! 🥳🎈🎉'
  end
end
