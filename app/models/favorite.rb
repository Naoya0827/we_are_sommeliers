class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :drink
end
