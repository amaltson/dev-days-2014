require 'rails_helper'

describe EndpointsController, type: :controller do
  let!(:endpoint_db) do
    Endpoint.create!(name: 'cv4direct', endpoint_type: 'direct',
                    url: 'http://something')
  end

  describe "GET #index" do
    it "response with all the endpoints" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      endpoints = JSON.parse(response.body, symbolize_names: true)
      expect(endpoints.count).to eq(1)

      endpoint = endpoints.first
      expect(endpoint[:name]).to eq(endpoint_db.name)
      expect(endpoint[:endpoint_type]).to eq(endpoint_db.endpoint_type)
      expect(endpoint[:url]).to eq(endpoint_db.url)
    end
  end
end
