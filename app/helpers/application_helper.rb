module ApplicationHelper
	def attend_type(guest)
		case guest.attend_bit
		when nil then "none"
		when true then "attend"
		when false then "absent"
		end
	end
end
