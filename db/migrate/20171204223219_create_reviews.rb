class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :reservation, foreign_key: true
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
