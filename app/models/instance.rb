class Instance < ActiveRecord::Base
  belongs_to :service
  has_many :endpoints
end
