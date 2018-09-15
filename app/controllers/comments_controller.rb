class CommentsController < ApplicationController
  before_action :set_user, only: [:create, :update]
  before_action :set_comment_target, only: [:create, :update]

  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user = @user
    @comment.comment_target = @comment_target
    if @comment.save
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  private

  def set_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:comment_target_id, :comment_target_name, :user_id, :content)
  end

  def set_comment_target
    @comment_target = Post.find(params[:post_id]) if params[:post_id]
    @comment_target = Comment.find(params[:comment_id]) if params[:comment_id]
  end
end
