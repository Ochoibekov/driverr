class AddDriverToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :driver, foreign_key: true
  end
end
