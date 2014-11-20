class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    respond_to do |format|
      format.html { render html: @restaurants, status: 200} 
      format.json { render json: @restaurants, status: 200}
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
    # respond_to do |format|
    #   format.html { render html: @restaurant, status: 201} 
    #   format.json { render json: @restaurant, status: 201}
    # end
  end

  def new
    restaurant = Restaurant.new
  end
  
  def create
    @restaurant = Restaurant.create(restaurant_params)
    # respond_to do |format|
    #   format.html { render html: @restaurant, status: 201} 
    #   format.json { render json: @restaurant, status: 201}
    # end
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update_attributes(restaurant_params)
    # respond_to do |format|
    #   format.html { render nothing: true, status: 204} 
    #   format.json { render nothing: true, status: 204}
    # end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    # respond_to do |format|
    #   format.html { render nothing: true, status: 204} 
    #   format.json { render nothing: true, status: 204}
    # end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :website, :phone_number, :address, :yelp_id, :image_url, :categories, :lat, :lng, :order_ids, :product_ids)
  end
end