class ApplicationController < ActionController::Base
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found
    
  helper_method :current_user, :logged_in?

  private

  def rescue_with_not_found
    render plain: 'Not found, try again'
  end

  def authenticate_user!
    unless current_user
      cookies[:return_to] = request.url
      redirect_to login_path, alert: 'Enter your account!'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
