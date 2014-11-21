class OrdersController < ApplicationController

  skip_before_filter :authorize
  
  def index
    orders = Order.all
    render json: orders, status: 200
  end

  def new
    order = Order.new
    # render json: order, status: 201
  end
  
  def create
    order = Order.create(order_params)
    render json: order, status: 201
  end

  def update
    order = Order.find(params[:id])
    order.update_attributes(order_params)
    render nothing: true, status: 204
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    render nothing: true, status: 204
  end

  private

  def order_params
    params.require(:order).permit(:product_count, :processing_time, :payment_id, :detail_id, :delivery_id, :restaurant_id, :product_id)
  end
end