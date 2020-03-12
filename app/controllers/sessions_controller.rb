class SessionsController < Devise::SessionsController


  def create
    super
    # NOTE: в принципе можно было не заморачиваться и показывать флэш сообщение
    # после каждого логина
    if current_user && current_user.sign_in_count == 1
      unless session[:display_welcome]
        flash.notice = "Welcome, #{current_user.first_name}"
        session[:display_welcome] = true
      end

    end

  end

end
