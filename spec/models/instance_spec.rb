require 'rails_helper'

describe Instance, type: :model do
  before(:each) do
    instance = Instance.new(name: 'CV 4', version_of_artifact: '4')
    instance.endpoints << Endpoint.create!(name: 'CVdirect', endpoint_type: 'direct',
                                           url: 'http://cvdirect')
    instance.save!
  end

  let(:instance) { Instance.all.first }

  it "should save a new service with instances" do
    expect(instance.name).to eq('CV 4')
    expect(instance.version_of_artifact).to eq('4')
    expect(instance.endpoints.size).to eq(1)
    expect(instance.endpoints.first.name).to eq('CVdirect')
  end
end
