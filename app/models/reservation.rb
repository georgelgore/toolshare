class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :reviews

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :valid_date_range_required
  validates :total_cost, presence: true


  def valid_date_range_required
    if (start_date && end_date) && (end_date < start_date)
      errors.add(:valid_until, "must be later than start date")
    end
  end
end
