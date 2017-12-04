class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.float :total_cost

      t.timestamps
    end
  end
end
