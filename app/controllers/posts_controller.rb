class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_user, only: [:create, :update, :delete]

  def index
    if params[:user_id]
      @posts = Post.where(user: User.find(params[:user_id])).order(created_at: 'desc')
    else
      @posts = Post.all.order(created_at: 'desc')
      @post = Post.new
    end
    @comment = Comment.new
    @reaction = Reaction.new
    @reaction_tags = ReactionTag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  def update

  end

  def delete

  end

  private

  def set_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:user_id, :category_id, :title, :content, :photo)
  end

end
