require 'rails_helper'

describe InstancesController, type: :controller do
  before(:each) do
    @service = Service.new(name: 'CV', group: 'Core')
    @instance = Instance.create!(name: 'Commuted Value 4', version_of_artifact: "4")
    @service.instances << @instance
    @service.save!
  end

  describe "GET #index" do
    it "response with all the current instances" do
      get :index, { service_id: @service.id }
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      instances = JSON.parse(response.body, symbolize_names: true)
      expect(instances.count).to eq(1)

      instance = instances.first
      expect(instance[:name]).to eq(@instance.name)
      expect(instance[:version_of_artifact]).to eq(@instance.version_of_artifact)
    end
  end

  describe "GET #show" do
    it "response with requested instance" do
      get :show, { service_id: @service.id, id: @instance.id }
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      instance = JSON.parse(response.body, symbolize_names: true)

      expect(instance[:name]).to eq(@instance.name)
      expect(instance[:version_of_artifact]).to eq(@instance.version_of_artifact)
    end
  end

end
