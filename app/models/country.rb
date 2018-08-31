class Country < ApplicationRecord
  has_many :posts
  has_many :user_countries
end
