class UsersController < ApplicationController


  def update
    current_user.blog_follower = params[:follow]
    current_user.save
    if params[:follow] == "true"
      flash[:success] = "Thanks, you are now signed up to receive notifications of new features."
    else
      flash[:danger] = "You are now unsubscribed."
    end
    redirect_to root_path
  end

end