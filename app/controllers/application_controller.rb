class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  protected

  def after_sign_in_path_for(user)
    # NOTE: стоит сделать метод User#admin?
    if user.class == Admin
      admin_tests_path
    elsif user.class == User
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
