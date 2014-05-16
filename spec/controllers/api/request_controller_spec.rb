require 'spec_helper'

describe Api::RequestController do

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end
  end

end
