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
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant Info Updated Successfully.'} 
        format.json { head :no_content}
      else
        format.html { render action: 'edit' } 
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url} 
      format.json { render nothing: true, status: 204}
    end
  end

  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :website, :phone_number, :address, :yelp_id, :image_url, :categories, :lat, :lng, :user_id, order_ids: [], product_ids: [])
  end
end