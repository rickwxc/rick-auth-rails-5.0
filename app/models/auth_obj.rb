class AuthObj < ApplicationRecord

	def auth_obj_display_name
		self.auth_name
	end


	def auth_obj_unitprice
		self.auth_unitprice
	end

end
