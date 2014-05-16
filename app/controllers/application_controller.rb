class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  add_flash_types :error, :success

	private

	def current_user
  	session[:user_id]
	end


  def session_expiry
    expire_time = session[:expires_at] || Time.current
    @time_left = (expire_time - Time.current).to_i
    unless @time_left > 0
      reset_session
      flash[:error] = 'Please login to continue'
    end
  end


  def login_required
    if session[:user_id]
       # set current user object to @current_user object variable
      @current_user = current_user
      return true
    else
      redirect_to login_path, error:"Please login to continue"
      return false
    end
  end
end
