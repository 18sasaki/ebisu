json.extract! guest, :id, :id_hash, :name, :post_number, :address, :phone_number, :sex_bit, :child_bit, :invite_message, :host_bit, :tomo_message, :eri_message, :attend_bit, :guest_message, :created_at, :updated_at
json.url guest_url(guest, format: :json)
