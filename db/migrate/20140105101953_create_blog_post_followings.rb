class CreateBlogPostFollowings < ActiveRecord::Migration
  def change
    create_table :blog_post_followings do |t|
      t.integer :follower_id
      t.integer :blog_post_id
      t.timestamps
    end
  end
end
