class PostsController < ApplicationController
  before_action :set_user, :set_posts
  def index
  end

  def show
    @comments = Comment.where(post: @post)
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_posts
    @posts = Post.where(author: @user)
    @post = Post.find(params[:id])
  end
end
