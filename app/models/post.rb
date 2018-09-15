class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :country
  has_many :comments, as: :comment_target, dependent: :destroy
  has_many :reactions, as: :reaction_target, dependent: :destroy
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :country
  mount_uploader :photo, PhotoUploader
end
