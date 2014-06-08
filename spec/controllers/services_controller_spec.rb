require 'rails_helper'

describe ServicesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)
    end
  end
end
