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

		if mobile
			s = s + mobile + ' ' 
		end

		if company
			s = s + 'Company: ' + company + ' ' 
		end

		s  = s + auth_addr.full

		s
	end

end
