class RestaurantsController < ApplicationController
  skip_before_filter :authorize, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all
  end
  
  def show
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
      redirect_to @restaurant
    else
      redirect_to user_path(current_user)
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
    @result = Yelp.client.search('San Francisco', { term: 'food' })
  end

  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :website, :phone_number, :street_address_1, :street_address_2, :city, :state, :zipcode, :country, :yelp_id, :image_url, :categories, :lat, :lng, :user_id, order_ids: [], product_ids: [])
  end
end