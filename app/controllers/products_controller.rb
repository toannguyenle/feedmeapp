class ProductsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show, :wdi]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def wdi
    if (params[:api_key] == "l3tsd0WD1")
      @products = Product.all
      render json: @products, status: 200
    else
      render json: {message: 'Hey Wrong Key!'}, status: 400
    end
  end

  def ordrin_search
    # ORDRIN TEST
    require "ordrin"
    ordrin_api = Ordrin::APIs.new(ENV["OD_SECRET"], :test)
    raise params[:ordrin].inspect
    args = {:datetime => 'ASAP', :zip => '90401', :city => 'Santa Monica',:addr => '1520 2nd St'}
    delivery_list = ordrin_api.delivery_list(args)
    render json: delivery_list, status: 200
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.first
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.restaurants.first.products.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:ordrin, :name, :categories, :description, :image_urls, :regular_price, :discount_price, :discount_start_time, :discount_end_time, :discount_inventory, :ordr, :delivery_method, :restaurant_id)
    end
end
