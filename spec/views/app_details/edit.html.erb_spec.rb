require 'spec_helper'

describe "app_details/edit" do
  before(:each) do
    @app_detail = assign(:app_detail, stub_model(AppDetail,
      :name => "MyString",
      :redirect_url => "MyText",
      :client_id => "MyString",
      :secret_code => "MyString"
    ))
  end

  it "renders the edit app_detail form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", app_detail_path(@app_detail), "post" do
      assert_select "input#app_detail_name[name=?]", "app_detail[name]"
      assert_select "textarea#app_detail_redirect_url[name=?]", "app_detail[redirect_url]"
      assert_select "input#app_detail_client_id[name=?]", "app_detail[client_id]"
      assert_select "input#app_detail_secret_code[name=?]", "app_detail[secret_code]"
    end
  end
end
