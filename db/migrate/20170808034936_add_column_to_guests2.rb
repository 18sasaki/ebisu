class AddColumnToGuests2 < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :mail_address, :string
  	rename_column :guests, :address, :address_1
    add_column :guests, :address_2, :string
    add_column :guests, :group_string, :string
  end
end
