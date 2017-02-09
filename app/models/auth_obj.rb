class AuthObj < ApplicationRecord

	def auth_obj_display_name
		self.auth_name
	end

	def auth_obj_unitprice
		self.auth_unitprice
	end

	def auth_disabled_for_checkout
		return self.auth_is_disabled == true
	end

end
