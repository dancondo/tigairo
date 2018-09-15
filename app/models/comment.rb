class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comment_target, polymorphic: true
  has_many :comments, as: :comment_target, dependent: :destroy
  has_many :reactions, as: :reaction_target, dependent: :destroy
  validates :content, presence: true

  def self.count_all(comments_array)
    total = comments_array.count
    comments_array.each do |comment|
      total += count_all(comment.comments)
    end
    total
  end
end
