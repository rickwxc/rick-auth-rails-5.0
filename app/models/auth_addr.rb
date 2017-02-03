class AuthAddr < ApplicationRecord
	belongs_to:auth_sb

	def full
		s = (self.unit_no.present?? (self.unit_no + ' '):('') ) + (self.street_number) + ' ' + (self.street) + ', ' + (
			self.auth_sb.name  ) + ', ' + (
				self.auth_sb.auth_st.name 
			) + ", " + (
				self.auth_sb.auth_st.auth_gj.name 
			)

		s
	end

end
