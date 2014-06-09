require 'rails_helper'

describe Service, type: :model do
  let(:service) do
    service = Service.new(name: 'CV', group: 'Core')
    service.instances << Instance.create!(name: 'CV 4', version_of_artifact: '4')
    service
  end

  it "should save a new service with instances" do
    expect(service.name).to eq('CV')
    expect(service.group).to eq('Core')
    expect(service.instances.size).to eq(1)
    expect(service.instances.first.name).to eq('CV 4')
  end
end
