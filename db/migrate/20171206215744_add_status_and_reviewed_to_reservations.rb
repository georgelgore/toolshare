class AddStatusAndReviewedToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :completed?, :boolean, default: false
    add_column :reservations, :reviewed?, :boolean, default: false
  end
end
