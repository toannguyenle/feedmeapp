class UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end

  def new
    user = User.new
    # render json: user, status: 201
  end
  
  def create

    # Added for Authentication
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up!"
    else
      render "new"
  end
    # SB: Determine if the below 2 lines need to be present?
    user = User.create(user_params)
    render json: user, status: 201
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    render nothing: true, status: 204
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render nothing: true, status: 204
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation, :lat, :lng, :order_id)
  end
end