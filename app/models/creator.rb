class Creator < ApplicationRecord
  has_many :drinks
  belongs_to :area
end
