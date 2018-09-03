class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  skip_before_action :reset_session_modal, only: :show
  before_action :set_user, only: [:show, :update, :avatar_viewer, :edit_avatar]

  def show
    authorize @user
  end

  def avatar_viewer
    authorize @user
  end

  def edit_avatar
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      if params[:user][:photo].present?
        session[:modal] = true
        redirect_to @user
        # redirect_to edit_image_url(record: @user)
      else
        redirect_to @user
      end
    else
      redirect_to @user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :description, :photo, :crop_x, :crop_y, :crop_w, :crop_h, country_ids: [])
  end
end
