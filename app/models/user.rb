require 'digest/md5'

class User < ActiveRecord::Base
  has_one :token
  has_many :app_details
	
  before_validation :prep_email

  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password_digest, presence: true


  def self.authenticate_user params
    user = where(email: params[:email]).first rescue nil
    if user && user.authenticate(params[:password])
      return user
    else
      return false
    end
  end

  private

  def prep_email
    self.email = self.email.strip.downcase if self.email
  end

end
