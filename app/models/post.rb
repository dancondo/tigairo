class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  accepts_nested_attributes_for :category
  mount_uploader :photo, PhotoUploader
end
