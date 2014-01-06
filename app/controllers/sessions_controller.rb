class SessionsController < ApplicationController

  def create
    # raise request.env['omniauth.auth'].to_yaml
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    flash[:success] = "You are now signed in. Enjoy!"
    FacebookWorker.perform_async(@user.id)
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You have been signed out."
    redirect_to root_url
  end
end