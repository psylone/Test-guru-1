class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_requested_page
    else
      flash.now[:alert] = 'Verify E-mail and password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to login_path
  end

  private

  def redirect_to_requested_page
    redirect_to cookies.delete(:path) || root_path # Cannot redirect to nil!
  end

end
