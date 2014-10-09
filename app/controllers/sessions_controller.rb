class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    @user = User.authentication(auth)
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Signed in!"
  end

  def failure
    redirect_to root_path, notice: 'Failed to login'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
end
