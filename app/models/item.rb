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


  def name_with_price_location
    "#{self.name} - $#{self.cost_daily} - #{self.location.name} "
  end

  def average_rating
    ratings = self.reviews.collect{|review|review.rating}
    if ratings.empty?
      "Item not reviewed yet."
    else
    average = ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
    end
  end

  def get_reviews
    self.reservations.each do |reservation|
      return reservation.reviews
    end
  end


  def self.filter_by_location(location)
    return Item.all if location.zero?
    Item.all.select{|item| item.location.id == location}
  end

  def self.filter_by_tool_type_id(tool_type)
    return Item.all if tool_type.zero?
    Item.all.select{|item| item.tool_type_id == tool_type}
  end

  def self.filter_by_min_cost(min_cost)
    return Item.all if min_cost.zero?
    Item.all.select{|item| item.cost_daily > min_cost}
  end

  def self.filter_by_max_cost(max_cost)
    return Item.all if max_cost.zero?
    Item.all.select{|item| item.cost_daily > max_cost}
  end

  def available?
    if self.available
      return "Available"
    else
      return "Not Available"
    end
  end

  def change_availability
    self.available = !self.available
  end
end
