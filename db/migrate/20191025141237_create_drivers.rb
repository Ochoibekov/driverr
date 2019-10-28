class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.string :pin
      t.string :bigint
      t.string :passport_number
      t.string :string
      t.string :passport_series
      t.string :string

      t.timestamps
    end
  end
end
