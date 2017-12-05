class Location < ApplicationRecord
  has_many :users
  has_many :items
  has_many :reservations, through: :items

  validates :name, presence: true

end
