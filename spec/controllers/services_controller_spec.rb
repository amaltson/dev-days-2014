require 'rails_helper'

describe ServicesController, type: :controller do
  let!(:service_db) { Service.create!(name: 'CV', group: 'Core Service',
                                      jira: 'http://jira',
                                      confluence: 'http://confluence') }

  describe "GET #index" do
    it "response with all the current services" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      services = JSON.parse(response.body, symbolize_names: true)
      expect(services.count).to eq(1)

      service = services.first
      expect(service[:name]).to eq(service_db.name)
      expect(service[:group]).to eq(service_db.group)
      expect(service[:jira]).to eq(service_db.jira)
      expect(service[:confluence]).to eq(service_db.confluence)
    end
  end

  describe "GET #show" do
    it "response with only the requested service" do
      get :show, { id: service_db.id }
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      service = JSON.parse(response.body, symbolize_names: true)

      expect(service[:name]).to eq(service_db.name)
    end
  end
end
