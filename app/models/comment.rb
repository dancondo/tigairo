class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :reactions, as: :reaction_target, dependent: :destroy
  validates :content, presence: true
end
