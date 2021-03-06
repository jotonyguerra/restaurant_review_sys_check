class Review < ApplicationRecord
  RATINGS = [5, 4, 3, 2, 1]
  belongs_to :restaurant
  validates :rating, inclusion: { in: RATINGS }, presence: true
  validates :body, presence: true, allow_blank: false
end
