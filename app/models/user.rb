class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[user admin]
  enum status: %i[active inactive]

  after_create :send_welcome_email

  def active_for_authentication?
    super and self.active?
  end

  def send_welcome_email
    return if Rails.env.test?

    UserMailer.with(user_id: id).welcome_email.deliver_later
  end
end
