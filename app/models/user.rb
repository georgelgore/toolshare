class User < ApplicationRecord
  has_many :reservations
  has_many :items, through: :reservations
  belongs_to :location

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :location_id, presence: true

end
