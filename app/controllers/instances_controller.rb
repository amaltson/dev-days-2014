class InstancesController < ApplicationController
  before_filter :get_service

  def get_service
    @service = Service.find(params[:service_id])
  end

  def index
    render json: @service.instances
  end

  def show
    render json: @service.instances.find(params[:id]), status: :ok
  end
end
