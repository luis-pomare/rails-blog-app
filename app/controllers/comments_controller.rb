class CommentsController < ApplicationController
  def new
    @new_comment = Comment.new
  end

  def create
    @comment = Comment.new(text: params.require(:comment).permit(:text)[:text], author: current_user,
                           post: Post.find(params[:post_id]))

    if @comment.save
      redirect_to root_path, notice: 'Comment created successfully'
    else
      render :new
    end
  end
end
