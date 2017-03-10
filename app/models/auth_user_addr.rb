class AuthUserAddr < ApplicationRecord
	belongs_to:auth_addr

	def full
		s = ''

		if firstname && firstname != ''
			s = s + firstname + ' ' 
		end

		if lastname && lastname != ''
			s = s + lastname + ' ' 
		end

		if mobile && mobile != ''
			s = s + mobile + ' ' 
		end

		if company && company != ''
			s = s + 'Company: ' + company + ' ' 
		end

		s  = s + auth_addr.full

		s
	end

end
