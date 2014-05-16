class UsersController < ApplicationController
  layout 'login'
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up!!!"
    else
      redirect_to app_details_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
