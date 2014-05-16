require "spec_helper"

describe AppDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/app_details").should route_to("app_details#index")
    end

    it "routes to #new" do
      get("/app_details/new").should route_to("app_details#new")
    end

    it "routes to #show" do
      get("/app_details/1").should route_to("app_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/app_details/1/edit").should route_to("app_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/app_details").should route_to("app_details#create")
    end

    it "routes to #update" do
      put("/app_details/1").should route_to("app_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/app_details/1").should route_to("app_details#destroy", :id => "1")
    end

  end
end
