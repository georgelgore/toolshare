class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?

  # who is my current user
  # am i logged in or not
  def current_user
    if session[:email]
      @current_user ||= User.find(session[:email])
    end
  end


  def logged_in?
    !!current_user
  end


  # def authorized
  #   if logged_in?
  #   else
  #     redirect_to signin_path
  #   end
  # end


end
