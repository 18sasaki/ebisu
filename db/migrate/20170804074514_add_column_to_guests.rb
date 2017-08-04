class AddColumnToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :allergy_comment, :text
  end
end
