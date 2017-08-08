json.extract! guest, :id, :id_hash, :name, :post_number, :address_1, :address_2, :mail_address, :phone_number, :sex_bit, :child_bit, :invite_message, :host_bit, :tomo_message, :eri_message, :attend_bit, :guest_message, :allergy_comment, :group_string, :created_at, :updated_at
json.url guest_url(guest, format: :json)
