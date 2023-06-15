class PostsController < ApplicationController
  before_action :set_user, :set_post
  def index
  end

  def show
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_post
    @posts = Post.where(author: @user)
  end
end
