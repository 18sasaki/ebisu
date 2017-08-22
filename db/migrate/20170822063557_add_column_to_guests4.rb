class AddColumnToGuests4 < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :short_url, :string
  end
end
