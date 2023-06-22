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

  def add_comment
    @comment = Comment.new author_id: params[:current_user], post_id: params[:post_id], text: params[:text]
    if @comment.save
      render json: { message: 'comment created', comment: @comment }, status: :ok
    else
      render json: { message: 'not created' }, status: :unprocessable_entity
    end
  end
end
