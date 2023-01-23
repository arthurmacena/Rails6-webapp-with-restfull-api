class ApplicationController < ActionController::Base
  include Pundit::Authorization
  after_action :verify_authorized, unless: :devise_controller?
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do |exception|
    policy = exception.policy

    if policy.respond_to?(:policy_error_message) && policy.policy_error_message.present?
      message = policy.policy_error_message
    else
      policy_name = exception.policy.class.to_s.underscore
      query = exception.query
      message = t("#{policy_name}.#{query}", scope: "pundit", default: :default)
    end

     flash[:error] = message
     redirect_to(root_path)
  end
end
