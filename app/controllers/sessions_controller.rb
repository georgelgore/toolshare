class SessionsController < ApplicationController

  def new
    if session[:email]
      redirect_to current_user
    end
  end


  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # you are who you say you are

      session[:email] = user.id
      flash[:message] = "Welcome #{user.name}"
      redirect_to user
    else

      # sign in failed
      flash[:message] = "Wrong username and password"
      redirect_to signin_path

    end
  end


  def destroy
    session[:email] = nil
    redirect_to signin_path
  end



end
