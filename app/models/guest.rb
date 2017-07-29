class Guest < ApplicationRecord
	validates :attend_bit, inclusion: { in: [true, false] }, on: :by_guest
end
