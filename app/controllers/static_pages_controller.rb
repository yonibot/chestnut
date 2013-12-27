class StaticPagesController < ApplicationController
 
  def index
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friends_with_chestnut, owner_type: "User") unless !current_user
  end

end