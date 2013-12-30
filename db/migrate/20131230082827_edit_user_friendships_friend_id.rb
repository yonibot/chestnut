class EditUserFriendshipsFriendId < ActiveRecord::Migration
  def change
    rename_column :user_friendships, :fb_friend_id, :facebook_friend_id
  end
end
