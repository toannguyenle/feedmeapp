class SessionsController < ApplicationController
	skip_before_filter :authorize

  def new
    @user = User.new
    @is_login = true
    @is_signup = false
  end

  def create
    user = User.where(email: params[:email]).first
    # first make sure we actually find a user
    # then see if user authenticates
    if user && user.authenticate(params[:password])
      # sets the cookie to the browser
      session[:user_id] = user.id
      # Redirect business user to a diffent page
      if user.is_business
        redirect_to orders_path
      else
        redirect_to products_path, notice: "Logged in!"
      end
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    # Kill our cookies!
    reset_session
    redirect_to new_session_path, notice: "Logged out!"
  end
end
