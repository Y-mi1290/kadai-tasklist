module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    root to "/"
  end

  def logged_in?
    !!current_user
  end
end

