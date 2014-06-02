class Service < ActiveRecord::Base
  has_many :repository
  has_many :deployment
  has_many :instance
end
