class ProductsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show, :ordrin_search, :wdi, :ordrin_test]
  skip_before_filter  :verify_authenticity_token, only: [:ordrin_search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    render json: @products, status: 200
  end

  def wdi
    if (params[:api_key] == "l3tsd0WD1")
      @products = Product.all
      render json: @products, status: 200
    else
      render json: {message: 'Hey Wrong Key!'}, status: 401
    end
  end

  def yelp
    require 'yelp'
    client = Yelp::Client.new(
      { consumer_key: ENV["YP_CONSUMER_KEY"],
        consumer_secret: ENV["YP_CONSUMER_SECRET"],
        token: ENV["YP_TOKEN"],
        token_secret: ENV["YP_TOKEN_SECRET"]
      })

  end

  def ordrin_test
    require "ordrin"
    ordrin_api = Ordrin::APIs.new(ENV["OD_SECRET"], :test)
    rest_args = {:rid => '49442'}
    menu_items = ordrin_api.restaurant_details(rest_args)
    render json: menu_items, status: 200
  end

  def ordrin_search
    puts '***************ORDRN SEARCH CONTROLLER********************'
    require "ordrin"
    ordrin_api = Ordrin::APIs.new(ENV["OD_SECRET"], :test)

    # Checking the user's location input format
    # If address is given
    if params[:ordrin_lat]=='NA'
      args = {:datetime => 'ASAP', :zip => params[:ordrin_zip], :city => params[:ordrin_city], :addr => params[:ordrin_addr]}
    else
    # If not than use GEOCODER gem to reverse lookup the address
      userAddress = Geocoder.search(params[:ordrin_lat].to_s+','+params[:ordrin_lng].to_s).first.data['address_components']
      args = {:datetime => 'ASAP', :zip => userAddress[7]['long_name'], :city => userAddress[3]['long_name'], :addr => (userAddress[0]['long_name'] + ' ' + userAddress[1]['long_name'])}
    end
    # Get back list of local restaurant with delivery options
    restaurant_list = ordrin_api.delivery_list(args)  
    delivery_list = []

    # For each restaurant search their menu
    # Only search menu for restaurant within 1 mile radius so quick food
    # restaurant_list.select{|t| t['distance_miles'] <= 2.0 }.first(10).each do |r|
    restaurant_list.sort_by{ |t| t[:distance_miles] }.first(10).each do |r|
      # Assign restaurant ID from Ordrin
      rest_args = {:rid => r['id'].to_s}
      # API call to ORDRIN to get menu items for each restaurant
      menu_items = ordrin_api.restaurant_details(rest_args)

      # Assign restaurant info to menu items
      menu_items['restaurant_name'] = r['na']
      menu_items['restaurant_id ']= r['id']
      menu_items['distance_miles'] = r['distance_miles']
      menu_items['del'] = r['del']
      menu_items['mino'] = r['mino']
      menu_items['cu'] = r['cu']

      # Push result to list to send back to client
      delivery_list.push(menu_items)
    end

    # Get menu items for each restaurant
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
      params.require(:product).permit(:ordrin, :name, :categories, :description, :image_urls, :regular_price, :discount_price, :discount_start_time, :discount_end_time, :discount_inventory, :ordr, :delivery_method, :restaurant_id)
    end
end
