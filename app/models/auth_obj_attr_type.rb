class AuthObjAttrType < ApplicationRecord

	def display
		if self.show_name.to_s != ''
			return self.show_name.to_s 
		end

		self.name
	end

end
