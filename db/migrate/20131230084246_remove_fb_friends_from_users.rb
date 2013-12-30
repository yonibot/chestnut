class RemoveFbFriendsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fb_friends
  end
end
