class EndpointsController < ApplicationController
  def index
    render json: Endpoint.all
  end
end
