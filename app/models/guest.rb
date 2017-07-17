class Guest < ApplicationRecord
	validates :attend_bit, presence: true, on: :by_guest
end
