class Drink < ApplicationRecord
  has_many :reviews
  belongs_to :genre
  belongs_to :creator
  has_many :favorites, dependent: :destroy
  has_many :favorite_drinks, dependent: :destroy
  def favorite_drinked_by?(user)
    favorite_drinks.where(user_id: user).exists?
  end

  def avg_score
    unless self.reviews.empty?
      reviews.average(:rating).round(1).to_f
    else
      0.0
    end
  end
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:rating).round(1).to_f*100/5
    else
      0.0
    end
  end

end
