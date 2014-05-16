class SessionsController < ApplicationController
  layout 'login'
  def new
    if current_user
      redirect_to app_details_path and return 
    end
  end

  def create
      user = User.authenticate_user params
    if user
      session[:user_id] = user.id
      redirect_to app_details_path, success: "Logged in!"
    else
      redirect_to root_url, error: "Invalid Email/Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end
end
