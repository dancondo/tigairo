class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :posts
  has_many :user_countries, dependent: :destroy
  has_many :countries, through: :user_countries
  accepts_nested_attributes_for :countries

  def crop_photo
    photo.recreate_versions! if crop_x.present?
  end

end
