class UsersController < ApplicationController

  skip_before_filter :authorize, only: [:new, :create, :new_business]
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_same_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def new_business
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    # So the sign up link doesn't show when not needed
    @is_signup = true

    if @user.save
        session[:user_id] = @user.id.to_s
        redirect_to user_path(@user), notice: 'User was successfully created.'
        # format.html { redirect_to user_path(@user), notice: 'User was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @user }
    else
        redirect_to new_user_path, notice: 'User was not successfully created.'
        # format.html { render action: 'new' }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', notice: 'Cannot update user.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

private
  # make sure only user can edit, update and delete their own account
  def is_same_user
    if set_user != current_user
      redirect_to user_path(current_user)
    end
  end
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :lat, :lng, :is_business, :password, :password_confirmation, :password_digest)
  end

end