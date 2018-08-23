class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  def show
  end

  def update
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
