class Review < ApplicationRecord
  belongs_to :reservation

  validates :reservation_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end
