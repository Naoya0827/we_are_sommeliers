class Drink < ApplicationRecord
  has_many :reviews
  belongs_to :genre
  belongs_to :creator
  has_many :favorites, dependent: :destroy
  has_many :favorite_drinks, dependent: :destroy
  def favorite_drinked_by?(user)
    favorite_drinks.where(user_id: user).exists?
  end
end
