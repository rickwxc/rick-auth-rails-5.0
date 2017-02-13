class AuthUserAddr < ApplicationRecord
	belongs_to:auth_addr

	def full
		s = ''

		if firstname
			s = s + firstname + ' ' 
		end

		if lastname
			s = s + lastname + ' ' 
		end

		s  = s + auth_addr.full

		s
	end

end
