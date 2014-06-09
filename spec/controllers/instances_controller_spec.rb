require 'rails_helper'

describe InstancesController, type: :controller do
  describe "GET #index" do
    it "response with all the current services" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)
    end
  end

end
