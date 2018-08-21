class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :category
  mount_uploader :photo, PhotoUploader
end
