class OrdersController < ApplicationController
  before_action :set_order, only: [:confirmation, :complete_order, :show, :edit, :update, :destroy]
  
  def index
    if current_user.is_business

      @orders = Order.find_by_sql("
        SELECT o.id, o.status, o.payment_type, o.processing_time, o.delivery_option, o.delivered_by, o.user_id , o.created_at
        FROM users as u 
        INNER JOIN restaurants as r ON u.id = r.user_id 
        INNER JOIN products as p ON r.id = p.restaurant_id 
        INNER JOIN order_products as op ON p.id = op.product_id 
        INNER JOIN orders as o ON o.id = op.order_id
        WHERE u.id = "+current_user.id.to_s+";")

    else
      @orders = current_user.orders.all
    end
  end

  def show
    @order_products = @order.order_products.all;
    # @order_products = OrderProduct.where(order_id: current_user.orders.where(status:'Open').first.id)
    # current_user.orders.where(status:'Open').first.order
  end
  
  def new
    if params[:format]
      @product = Product.find(params[:format])
      @order = Order.new
    else
      redirect_to products_path, notice: 'Please select your favorite food first!'
    end
    # CONSUME LIVING ROOM API
    @livingroom = JSON.parse(HTTParty.get('https://livingroom.herokuapp.com/api/movies').body)
  end

  def edit
  end

  # Add new product to Order (make a new order)
  def add_to_current_order

    # get the first open order that the user has
    if current_user.orders.where(status:'Open').first
      current_order = current_user.orders.where(status:'Open').first
      OrderProduct.create({product_id: params[:product],order_id: current_order.id, quantity: params[:order][:orderproduct][:quantity], price: params[:order][:orderproduct][:price],additional_info: params[:order][:orderproduct][:additional_info] })

    # If not open and create a new order for the current user
    else
      current_order = current_user.orders.create(order_params)
      current_order.update(status: 'Open')
      OrderProduct.create({product_id: params[:product],order_id: current_order.id, quantity: params[:order][:orderproduct][:quantity], price: params[:order][:orderproduct][:price],additional_info: params[:order][:orderproduct][:additional_info]})
    end
    redirect_to order_path(current_order)
  end

  # Complete order
  def complete_order
    @order.update(status: 'Placed')
    redirect_to order_confirmation_path(@order)
  end

  def confirmation
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private

  def set_order
      @order = Order.find(params[:id])
  end
    
  def order_params
    params.require(:order).permit(:product_count, :processing_time, :payment_type, :amount, :status, :delivery_option, :delivered_by, :additional_info, :user_id, :product_id)
  end

end

