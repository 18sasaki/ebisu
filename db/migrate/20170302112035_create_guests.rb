class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string  :id_hash,     :null => false
      t.string  :name,        :null => false
      t.string  :post_number, :null => false
      t.string  :address,     :null => false
      t.string  :phone_number
      t.boolean :sex_bit,     :null => false
      t.boolean :child_bit,   :null => false, :default => 0
      t.text    :invite_message
      t.boolean :host_bit,    :null => false
      t.text    :tomo_message
      t.text    :eri_message
      t.boolean :attend_bit
      t.text    :guest_message

      t.timestamps
    end
  end
end
