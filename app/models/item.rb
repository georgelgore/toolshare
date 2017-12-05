class Item < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews, through: :reservations
  belongs_to :location
  belongs_to :tool_type

  validates :name, presence: true
  validates :brand, presence: true
  validates :tool_type_id, presence: true
  validates :cost_daily, presence: true
  validates :cost_hourly, presence: true
  validates :available, presence: true
  validates :location_id, presence: true

end
