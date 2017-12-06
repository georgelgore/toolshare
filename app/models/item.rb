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
  validates :cost_daily, numericality: true
  validates :cost_hourly, presence: true
  validates :cost_hourly, numericality: true
  validates :available, presence: true
  validates :location_id, presence: true


  def name_with_price
    "#{self.name} - $#{self.cost_daily} "
  end

  def average_rating
    ratings = self.reviews.collect{|review|review.rating}
    ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
  end

  def get_reviews
    self.reservations.each do |reservation|
      return reservation.reviews
    end
  end

  def self.unique_brands
    Item.all.map{|item| item.brand}.uniq
  end

end
