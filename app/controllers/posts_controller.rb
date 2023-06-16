class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :set_user, :set_posts
  def index; end

  def show
    @comments = Comment.where(post: @post)
  end

  def new
    @new_post = Post.new
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_posts
    @posts = Post.where(author: @user)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
