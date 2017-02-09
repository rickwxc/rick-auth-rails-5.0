class AuthCart < ApplicationRecord

	def metas
		if !auth_obj_meta_json
			return {}
		end

		begin
			v = JSON.parse(auth_obj_meta_json)
			return v
		rescue JSON::ParserError => e  
		end 

		return {}
	end

end
