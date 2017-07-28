class AuthOrder2obj < ApplicationRecord

	def obj
		obj = self.auth_obj_model_name.constantize.where(:id => self.auth_obj_id).first


		obj
	end

end
