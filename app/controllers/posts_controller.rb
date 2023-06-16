class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :set_user, :set_posts, only: %i[index show]

  def index; end

  def show
    @comments = Comment.where(post: @post)
  end

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user # only index and show
    @user = User.find(params[:user_id])
  end

  def set_posts # only index and show
    @posts = Post.where(author: @user)
  end

  def set_post # only show
    @post = Post.find(params[:id])
  end
end
