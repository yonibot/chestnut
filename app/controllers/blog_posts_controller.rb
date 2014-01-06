class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.all
    @blog_post = BlogPost.new
  end

  def create
    post = BlogPost.new(params[:blog_post])
    post.save
    redirect_to blog_posts_path
  end




end