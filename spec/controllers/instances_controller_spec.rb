require 'rails_helper'

describe InstancesController, type: :controller do
  let!(:instance_db) do
    Instance.create!(name: 'Commuted Value 4', version_of_artifact: "4")
  end

  describe "GET #index" do
    it "response with all the current instances" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.content_type).to eq(Mime::JSON)

      instances = JSON.parse(response.body, symbolize_names: true)
      expect(instances.count).to eq(1)

      instance = instances.first
      expect(instance[:name]).to eq(instance_db.name)
      expect(instance[:version_of_artifact]).to eq(instance_db.version_of_artifact)
    end
  end

end
