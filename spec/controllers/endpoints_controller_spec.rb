require 'rails_helper'

describe EndpointsController, type: :controller do

  describe "GET #index" do
    it "response with all the endpoints" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)
    end
  end
end
