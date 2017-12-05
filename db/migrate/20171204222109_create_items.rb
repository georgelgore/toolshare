class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.float :cost_daily
      t.float :cost_hourly
      t.boolean :available
      t.belongs_to :location, foreign_key: true
      t.belongs_to :tool_type, foreign_key: true

      t.timestamps
    end
  end
end
