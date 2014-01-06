require 'spec_helper'


describe BlogPostsController do

  describe "POST create" do
    it "creates a blog post with valid title and body" do
      post :create, blog_post: Fabricate.attributes_for(:blog_post)
      expect(BlogPost.count).to eq(1)
    end

    it "does not create a blog post with empty title" do
      post :create, blog_post: Fabricate.attributes_for(:blog_post, title:"")
      expect(BlogPost.count).to eq(0)
    end

    it "does not create a blog post with empty body" do
      post :create, blog_post: Fabricate.attributes_for(:blog_post, body:"")
      expect(BlogPost.count).to eq(0)
    end

  end



end