require 'spec_helper'

describe "app_details/show" do
  before(:each) do
    @app_detail = assign(:app_detail, stub_model(AppDetail,
      :name => "Name",
      :redirect_url => "MyText",
      :client_id => "Client",
      :secret_code => "Secret Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Client/)
    rendered.should match(/Secret Code/)
  end
end
