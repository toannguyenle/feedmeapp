class OrderproductsController < ApplicationController
  before_action :set_orderproduct, only: [:edit, :show, :update, :destroy]

  def edit
    @orderproduct = OrderProduct.find(params[:id])
  end
  def show
    @orderproduct = OrderProduct.find(params[:id])
  end
  def update
    if @orderproduct.update(orderproduct_params)
      redirect_to current_user.orders.where(status:'Open').first
    end
  end

  def destroy
    @orderproduct.destroy
    redirect_to current_user.orders.where(status:'Open').first
  end

  private

  def set_orderproduct
      @orderproduct = OrderProduct.find(params[:id])
  end
    
  def orderproduct_params
    params.require(:order_product).permit(:order_id, :product_id, :quantity, :price, :additional_info)
  end

end

