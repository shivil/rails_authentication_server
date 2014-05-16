class Api::RequestController < ApplicationController
  
  def new
  	@authenticate = AppDetail.authenticate_app(params)
    if @authenticate.is_a?(Hash)
      render json: @authenticate
    else
  	 @redirect_uri = params[:redirect_uri]
  	end
  end

  def create
    user = User.authenticate_user params
    if user
      token = if user.token.blank?
                Token.create(user_id: user.id) 
              else
                user.token
              end
      url = params[:redirect_uri]
      url += "?" unless params[:redirect_uri].include?("?")
      url +=  {code: token.code}.to_param
      redirect_to url
    else
      render 'new', :redirect_uri => params[:redirect_uri]
    end

  end

  def callback
    response = begin
      token = Token.where(code: params[:code]).first
          {status: true, access_token: token.access_token}
        rescue Exception => e
          {status: false, reason: "Invalid Request"}
        end
    render json: response
  end

end
