class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = @current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to user_path(@current_user), notice: "comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
