class Drink < ApplicationRecord
  has_many :reviews
  belongs_to :genre
  belongs_to :creator
end
