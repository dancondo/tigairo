class Reaction < ApplicationRecord
  belongs_to :reaction_target, polymorphic: true
  belongs_to :reaction_tag
  belongs_to :user
end
