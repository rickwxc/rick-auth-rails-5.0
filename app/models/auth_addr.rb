class AuthAddr < ApplicationRecord
	belongs_to:auth_sb, :optional => true

	def full
		if !auth_sb
			return org
		end

		s = (self.unit_no.present?? (self.unit_no + '/'):('') ) + (self.street_number.to_s) + ' ' + (self.street.to_s) + ', ' + ( self.auth_sb.name) + ', ' + (
				self.auth_sb.auth_st.name 
			) + ", " + (
				self.auth_sb.auth_st.auth_gj.name 
			)

		s
	end

end
