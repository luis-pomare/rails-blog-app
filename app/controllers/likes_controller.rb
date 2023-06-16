class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.post_id = @post.id
    @like.author_id = @current_user.id
    @like.save unless Like.where(author_id: @current_user.id, post_id: @post.id).exists?
    redirect_to request.referrer || root_url
  end
end
