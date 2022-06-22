class Review < ApplicationRecord
  belongs_to :drink
  belongs_to :user
  attachment :image
  has_many :reviewcomments, dependent: :destroy
end
