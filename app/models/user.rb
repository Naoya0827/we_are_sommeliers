class User < ApplicationRecord
  attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :reviewcomments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_drinks, dependent: :destroy

  has_many :relationships, foreign_key: :followed_id
  has_many :followeds, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :followed

  def is_followed_by?(user)
    reverse_of_relationships.find_by(followed_id: user.id).present?
  end
end
