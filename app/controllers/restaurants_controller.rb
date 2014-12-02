class RestaurantsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :business_yelp]
  def index
    @restaurants = Restaurant.all
  end
  
  def show
    if (@restaurant.yelp_id != "")
      @yelp_result = Yelp.client.business(@restaurant.yelp_id)
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end
  
  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if current_user.is_business 
      @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant created successfully. Now build your menu!'
    else
      redirect_to user_path(current_user), notice: 'Only Business User Can Create Restaurant'
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Restaurant Info Updated Successfully.' 
    else
      render action: 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url
  end

  def business_yelp
    if (@restaurant.lat == "" || @restaurant.lat == nil)
      # Get address from restaurant address
      restaurant_address = @restaurant.street_address_1 + ', ' + @restaurant.city + ', ' + @restaurant.state
      geocode = Geocoder.search(restaurant_address)[0].geometry['location']
      @coordinates = { latitude: geocode['lat'], longitude: geocode['lng'] }
    else
      @coordinates = { latitude: @restaurant.lat, longitude: @restaurant.lng }
    end
    # Set coordinates for yelp search
    params = {
      term: 'restaurant',
      sort: 1,
      limit: 10
      }
    @result = Yelp.client.search_by_coordinates(@coordinates, params)
  end
  def claim_business
    @restaurant = Restaurant.find(params[:format])
    # Get more info on the business
    yelp_result = Yelp.client.business(params[:id])

    @restaurant.yelp_id = params[:id]
    @restaurant.image_url = yelp_result.image_url 
    @restaurant.website = yelp_result.url 
    @restaurant.categories = yelp_result.categories.join(", ")
    @restaurant.phone_number = yelp_result.phone 
    @restaurant.street_address_1 = yelp_result.location.address[0] 
    @restaurant.city = yelp_result.location.city 
    @restaurant.state = yelp_result.location.state_code 
    @restaurant.zipcode = yelp_result.location.postal_code
    @restaurant.lat = yelp_result.location.coordinate.latitude
    @restaurant.lng = yelp_result.location.coordinate.longitude
    @restaurant.save

    redirect_to @restaurant
  end
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :website, :phone_number, :street_address_1, :street_address_2, :city, :state, :zipcode, :country, :yelp_id, :image_url, :categories, :lat, :lng, :user_id, order_ids: [], product_ids: [])
  end
end