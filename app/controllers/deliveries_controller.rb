class DeliveriesController < ApplicationController

  skip_before_filter :authorize

  def index
    deliveries = Delivery.all
    render json: deliveries, status: 200
  end

  def new
    delivery = Delivery.new
    # render json: delivery, status: 201
  end
  
  def create
    delivery = Delivery.create(restaurant_params)
    render json: delivery, status: 201
  end

  def update
    delivery = Delivery.find(params[:id])
    delivery.update_attributes(delivery_params)
    render nothing: true, status: 204
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.destroy
    render nothing: true, status: 204
  end

  private

  def delivery_params
    params.require(:delivery).permit(:delivery_method, :delivered_by, :estimated_delivery_time, :address, :order_id)
  end
ends