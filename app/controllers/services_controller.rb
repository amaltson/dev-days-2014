class ServicesController < ApplicationController
  def index
    render json: Service.all, status: :ok
  end

  def show
    render json: Service.find(params[:id]), status: :ok
  end
end
