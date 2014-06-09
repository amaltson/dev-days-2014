class InstancesController < ApplicationController
  def index
    render json: Instance.all
  end
end
