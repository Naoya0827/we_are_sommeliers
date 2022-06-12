class Review < ApplicationRecord
  belongs_to :drink
  belongs_to :user
  attachment :image
end
