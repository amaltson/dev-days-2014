class EndpointsController < ApplicationController
  before_filter :get_instance

  def get_instance
  	@instance = Service.find(params[:service_id]).instances.find(params[:instance_id])
  end

  def index
    render json: @instance.endpoints
  end
end
