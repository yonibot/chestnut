class AddBlogFollowerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :blog_follower, :boolean
  end
end
