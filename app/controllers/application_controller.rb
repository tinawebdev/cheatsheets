class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?
  helper_method :current_user_admin?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )

    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:username, :password, :password_confirmation, :current_password]
    )
  end

  def current_user_can_edit?(model)
    user_signed_in? && model.user == current_user
  end

  def current_user_admin?
    current_user && current_user.admin?
  end
end
