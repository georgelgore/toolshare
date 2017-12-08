class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :reviews

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :valid_date_range_required
  validate :is_a_free_date?
  validates :total_cost, presence: true


  def valid_date_range_required
    if (start_date && end_date) && (end_date < start_date)
      errors.add(:valid_until, "Your check-out date needs to be after your check-in date! Ya goof.")
    end
  end

  def change_reviewed
    self.reviewed = !self.reviewed
  end


    def is_available_at_this_date
      Reservation.where(item_id: item.id).where.not(id: id).each do |r|
        booked_dates = r.start_date.to_date..r.end_date.to_date
        if booked_dates === self.start_date.to_date || booked_dates === self.end_date.to_date
          errors.add(:user_id, "This tool isn't available at this date.")
          return false
        else
          return true
        end
      end
    end

    # def check_out_after_check_in
    #   if start_date && end_date && end_date <= start_date
    #     errors.add(:user_id, "Your check-out date needs to be after your check-in date! Ya goof.")
    #     return false
    #   else
    #     return true
    #   end
    # end

    def not_in_past?
      if start_date < DateTime.now || end_date < DateTime.now
        errors.add(:user_id, "You can't book things in the past, ya goof!")
        return false
      end
    end

    def is_a_free_date?
      self.is_available_at_this_date &&  self.not_in_past?
    end

end
