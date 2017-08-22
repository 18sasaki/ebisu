class AddColumnToGuests3 < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :reception_bit, :boolean
  end
end
