class User < ApplicationRecord
  has_secure_password
  has_many :reservations
  has_many :items, through: :reservations
  has_many :reviews, through: :reservations
  belongs_to :location


  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :location_id, presence: true

end
