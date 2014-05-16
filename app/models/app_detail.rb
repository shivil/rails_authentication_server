class AppDetail < ActiveRecord::Base
  belongs_to :user
	before_create :generate_token

  def self.authenticate_app params
    if valid_url? params[:redirect_uri]
      begin
        details = where(client_id: params[:client_id], app_secret: params[:app_secret]).first 
        return details
      rescue Exception => e 
        return {status: false, reason: "Invalid App Details"}
      end
    else
      return {status: false, reason: "Invalid URI"}
    end
  end

	protected

  def generate_token
    self.app_secret = loop do
      random_code = SecureRandom.urlsafe_base64(nil, false)
      break random_code unless AppDetail.exists?(app_secret: random_code)
    end

    self.client_id = loop do
      random_id = SecureRandom.hex(12)
      break random_id unless AppDetail.exists?(client_id: random_id)
    end
  end

  def self.valid_url? url
    begin
      uri = URI.parse(url)
      return uri.kind_of?(URI::HTTP)
    rescue Exception => e
      return false
    end
    
  end

  def generate_temp_code
  end
end
