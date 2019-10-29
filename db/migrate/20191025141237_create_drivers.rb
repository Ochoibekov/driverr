class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :pin
      t.string :name
      t.string :last_name
      t.string :passport_number
      t.string :passport_series
      t.timestamps
    end
  end
end
