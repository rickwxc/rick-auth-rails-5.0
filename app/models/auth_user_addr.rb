class AuthUserAddr < ApplicationRecord
	belongs_to:auth_addr

	def full
		s = firstname + ' ' + lastname + ' '
		s  = s + auth_addr.full

		s
	end

end
