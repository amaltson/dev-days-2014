require 'rails_helper'

describe EndpointsController, type: :controller do
  before(:each) do
    @service = Service.new(name: "CV", group: "Core Service")
    @instance = Instance.new(name: "CV4")
    @endpoint = Endpoint.create!(name: 'cv4direct', endpoint_type: 'direct',
                    url: 'http://something')
    @instance.endpoints << @endpoint
    @service.instances << @instance
    @instance.save
    @service.save

    Endpoint.create!(name: 'Random endpoint')
  end

  describe "GET #index" do
    it "response with all the endpoints for a given service and instance" do
      get :index, {service_id: @service.id, instance_id: @instance.id}
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      endpoints = JSON.parse(response.body, symbolize_names: true)
      expect(endpoints.size).to eq(1)

      endpoint = endpoints.first
      expect(endpoint[:name]).to eq(@endpoint.name)
      expect(endpoint[:endpoint_type]).to eq(@endpoint.endpoint_type)
      expect(endpoint[:url]).to eq(@endpoint.url)
    end
  end
end
