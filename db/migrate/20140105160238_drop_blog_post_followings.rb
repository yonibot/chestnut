class DropBlogPostFollowings < ActiveRecord::Migration
  def change
    drop_table :blog_post_followings 
  end
end
