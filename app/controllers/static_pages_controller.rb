class StaticPagesController < ApplicationController


  def index
    if current_user && current_user.fb_friends
      @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friends_with_chestnut, owner_type: "User")
    end
  end

end