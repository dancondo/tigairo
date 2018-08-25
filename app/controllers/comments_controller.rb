class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :update]
  before_action :set_user, only: [:create, :update]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = @user
    @comment.post = @post
    if @comment.save
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content)
  end

end
