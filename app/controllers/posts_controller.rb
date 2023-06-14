class PostsController < ApplicationController
  before_action :set_user, only: %i[ index ]
  def index; end

  def show; end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
