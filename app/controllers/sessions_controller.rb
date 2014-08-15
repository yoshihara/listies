class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    # TODO: auth.infoやauth.credentialsを使ってuserモデルを作るようにする
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    session[:username] = auth.extra.access_token.params[:screen_name]
    redirect_to root_path#, notice: "Signed in!"
  end

  def failure
    redirect_to root_path#, notice: 'Failed to login'
  end

  def destroy
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    session[:username] = nil
    redirect_to root_path#, notice: "Signed out!"
  end
end
