class DropFollowerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :blog_follower?
  end
end
