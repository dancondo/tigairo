class CommentsController < ApplicationController
  before_action :set_post, ony: [:create, :update]
  def create

  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
