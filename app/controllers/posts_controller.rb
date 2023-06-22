class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  before_action :set_user, :set_posts, only: %i[index show]

  def index; end

  def show
    @comments = Comment.includes(:author).where(post: @post)
  end

  def new
    @new_post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_path(current_user), notice: 'Post was successfully created.'
    else
      puts @post.errors.full_messages # Add this line to display the validation errors in the console
      render :new, status: :unprocessable_entity
    end
  end

  private

  # only index and show
  def set_user
    @user = User.find(params[:user_id])
  end

  # only index and show
  def set_posts
    @posts = Post.where(author: @user)
  end

  # only show
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
