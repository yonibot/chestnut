class Admin::SessionsController < AdminsController


  def index
    @users = User.all
  end

  def create
    session["user_id"] = params[:id]
    redirect_to root_path
  end

end