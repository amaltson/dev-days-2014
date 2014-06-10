class InstanceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :version_of_artifact

  has_many :endpoints
end
