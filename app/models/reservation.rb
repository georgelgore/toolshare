class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :reviews

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_cost, presence: true


  # def total_cost
  #   @number_of_days = self.end_date - self.start_date
  #   @rate = self.item.cost_daily
  #   @number_of_days * @rate
  # end
end
