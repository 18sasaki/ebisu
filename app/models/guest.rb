class Guest < ApplicationRecord
	validates :attend_bit, inclusion: { in: [true, false] }, on: :by_guest

  def self.csv_import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # TODO: 名寄せか上書きかはじくか
      # TODO: csvファイルのheaderの最初の列の先頭に「・」が入ってエラーになる件が不明のまま
      guest = self.new
      guest.attributes = row.to_hash.slice(*updatable_attributes)
      guest.id_hash = Digest::MD5.hexdigest('tomo' + guest.name + 'eri')
      guest.save!
    end
  end

  def self.updatable_attributes
  	# table上のカラムの順番厳守かと思ったけど違った。
    ['name', 'post_number', 'address_1', 'phone_number', 'sex_bit', 'child_bit', 'invite_message', 'host_bit', 'tomo_message', 'eri_message', 'mail_address', 'address_2', 'group_string']
  end
end


