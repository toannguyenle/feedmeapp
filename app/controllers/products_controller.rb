class ProductsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show, :ordrin_search]
  skip_before_filter  :verify_authenticity_token, only: [:ordrin_search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    render json: delivery_list, status: 200
  end

  def ordrin_search
    puts '***************ORDRN TEST CONTROLLER********************'
    require "ordrin"
    ordrin_api = Ordrin::APIs.new(ENV["OD_SECRET"], :test)
    args = {:datetime => 'ASAP', :zip => params[:ordrin_zip], :city => params[:ordrin_city], :addr => params[:ordrin_addr]}
  
    # Get back list of local restaurant with delivery options
    restaurant_list = ordrin_api.delivery_list(args)  
    puts restaurant_list
    puts '***************ORDRN TEST CONTROLLER********************'
    delivery_list = []
    # For each restaurant search their menu
    # Only search menu for restaurant within 1 mile radius so quick food
    restaurant_list.select{|t| t['distance_miles'] <= 1.0 }.first(10).each do |r|
      puts '***************ORDRN TEST CONTROLLER********************'
      puts r['na']
      puts r['id']
      puts r['distance_miles']
      rest_args = {:rid => r['id'].to_s}
      # API call to ORDRIN to get menu items for each restaurant
      menu_items = ordrin_api.restaurant_details(rest_args)
      delivery_list.push(menu_items)
    end

    # Get menu items for each restaurant
    render json: [delivery_list, restaurant_list], status: 200
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
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:name, :categories, :description, :image_urls, :regular_price, :discount_price, :discount_start_time, :discount_end_time, :discount_inventory, :ordr, :delivery_method, :restaurant_id)
    end
end
