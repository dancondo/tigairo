class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def edit_image
    @record = User.find(params[:record])
  end
end
