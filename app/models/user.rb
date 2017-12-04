class User < ApplicationRecord
  has_many :reservations
  has_many :items, through: :reservations
  belongs_to :location
end
