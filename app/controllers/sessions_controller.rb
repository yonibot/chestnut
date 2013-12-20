class SessionsController < ApplicationController

  def create
    # raise request.env['omniauth.auth'].to_yaml
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:success] = "You are now signed in. Enjoy!"
    user.get_fb_friends
    redirect_to user_library_items_path(user)
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You have been signed out."
    redirect_to root_url
  end
end