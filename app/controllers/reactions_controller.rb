class ReactionsController < ApplicationController
  before_action :set_reaction_target

  def change
    if @reaction = Reaction.find_by(reaction_target: @reaction_target, user: current_user)
      authorize @reaction
      if @reaction.reaction_tag.id == params[:reaction_tag_id].to_i
        if @reaction.destroy
          redirect_to posts_url
        else
          redirect_to posts_url
        end
      elsif @reaction.update(reaction_params)
        redirect_to posts_url
      else
        redirect_to post_url
      end
    else
      @reaction = Reaction.new(reaction_params)
      authorize @reaction
      @reaction.reaction_target = @reaction_target
      @reaction.user = current_user
      if @reaction.save
        redirect_to posts_url
      else
        redirect_to posts_url
      end
    end
  end

  private

  def reaction_params
    params.permit(:reaction_target_id, :reaction_target_name, :reaction_tag_id, :user_id)
  end

  def set_reaction_target
    @reaction_target = Post.find(params[:post_id]) if params[:post_id]
    @reaction_target = Comment.find(params[:comment_id]) if params[:comment_id]
  end
end
