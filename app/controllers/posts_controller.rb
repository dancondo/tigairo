class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_post, only: [:update, :destroy]

  def index
    if params[:user_id]
      @posts = policy_scope(Post).where(user: User.find(params[:user_id])).order(created_at: 'desc')
    else
      @posts = policy_scope(Post).order(created_at: 'desc')
      @post = Post.new
    end
    @comment = Comment.new
    @reaction = Reaction.new
    @reaction_tags = ReactionTag.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user
    authorize(@post)
    if @post.save
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  def update
    authorize(@post)
    if @post.update(post_params)
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  def destroy
    authorize(@post)
    if @post.destroy
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :category_id, :country_id, :title, :content, :photo)
  end

end
