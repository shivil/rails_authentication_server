class Token < ActiveRecord::Base
  belongs_to :app_detail

  before_create :generate_tokens
  def generate_api_code

  end

  private
  
  def generate_tokens
    begin
      self.access_token = SecureRandom.hex(10)
    end while self.class.exists?(access_token: access_token)

    begin
      self.code = SecureRandom.hex(10)
    end while self.class.exists?(code: code)
  end
end
