class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_user, only: [:show, :update]

  def show
    authorize @user
  end

  def update
    authorize @user

    # @current_countries = UserCountry.where(user: @user)
    # @current_countries.destroy_all
    # user_params[:country_ids].each do |country_id|
    #   next if country_id.empty?
    #   MyTag.create(user: @user, country_id: country_id)
    # end

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
    params.require(:user).permit(:nickname, :photo, country_ids: [])
  end
end
