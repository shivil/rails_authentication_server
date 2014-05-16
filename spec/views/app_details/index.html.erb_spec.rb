require 'spec_helper'

describe "app_details/index" do
  before(:each) do
    assign(:app_details, [
      stub_model(AppDetail,
        :name => "Name",
        :redirect_url => "MyText",
        :client_id => "Client",
        :secret_code => "Secret Code"
      ),
      stub_model(AppDetail,
        :name => "Name",
        :redirect_url => "MyText",
        :client_id => "Client",
        :secret_code => "Secret Code"
      )
    ])
  end

  it "renders a list of app_details" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "Secret Code".to_s, :count => 2
  end
end
