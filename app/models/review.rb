class Review < ApplicationRecord
  belongs_to :reservation

  validates :reservation_id, presence: true
  validates :content, presence: true
  validates :content, length: { minimum: 5 }
  validates :rating, presence: true
  validates :rating, numericality: true
end
