class ApiController < ApplicationController
  def user_posts
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render json: @posts, status: :ok
  end

  def post_comments
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments, status: :ok
  end
end
