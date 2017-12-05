class CreateToolTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :tool_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
