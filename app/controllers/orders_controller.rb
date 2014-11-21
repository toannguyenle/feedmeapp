class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authorize, only: [:new]
  
  def index
    @orders = Order.all
  end

  def show
  end
  
  def new
    @product = Product.find(params[:format])
    @order = Order.new
  end

  def edit
  end
  
  def create
    @order = current_user.orders.new(order_params)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private

  def set_order
      @order = Order.find(params[:id])
  end
    
  def order_params
    params.require(:order).permit(:product_count, :processing_time, :payment_type, :amount, :status, :delivery_option, :delivered_by, :additional_info, :user_id, :product_id)
  end

end

