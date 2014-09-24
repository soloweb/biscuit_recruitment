class BlogPostsController < ApplicationController
  def show
    @blog_post = BlogPost.friendly.find(params[:id])
  end

  def index
    @blog_posts = BlogPost.all.page(params[:page]).per(8)
  end
end