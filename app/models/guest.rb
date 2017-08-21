class Guest < ApplicationRecord
	validates :attend_bit, inclusion: { in: [true, false] }, on: :by_guest

  def self.csv_import(file)
  	result_hash = {success: 0, duplication: 0, error: 0, error_message: []}
    CSV.foreach(file.path, headers: true) do |row|
    	begin
	      # TODO: csvファイルのheaderの最初の列の先頭に「・」が入ってエラーになる件が不明のまま
	      # 緊急対応で同名があったら上書きさせる
	     #  if Guest.find_by(name: row['name'])
		    # 	result_hash[:duplication] += 1
		    # else
		    #   guest = self.new
		    #   guest.attributes = row.to_hash.slice(*updatable_attributes)
		    #   guest.id_hash = Digest::MD5.hexdigest('tomo' + guest.name + 'eri')
		    #   guest.save!
		    # 	result_hash[:success] += 1
		    # end
	      guest = Guest.find_by(name: row['name']) || self.new
p guest
	      guest.attributes = row.to_hash.slice(*updatable_attributes)
	      guest.id_hash = Digest::MD5.hexdigest('tomo' + guest.name + 'eri')
	      guest.save!
	    	result_hash[:success] += 1
	    rescue => e
	    	result_hash[:error_message] << e
	    	result_hash[:error] += 1
	    end
    end
    result_hash
  end

  def self.updatable_attributes
  	# table上のカラムの順番厳守かと思ったけど違った。
    ['name', 'post_number', 'address_1', 'phone_number', 'sex_bit', 'child_bit', 'invite_message', 'host_bit', 'tomo_message', 'eri_message', 'mail_address', 'address_2', 'group_string']
  end
end


