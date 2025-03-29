class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
end
