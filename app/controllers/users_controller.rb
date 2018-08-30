class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_user, only: [:show, :update]

  def show
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :photo, :country_id)
  end
end
