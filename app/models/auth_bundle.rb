class AuthBundle < ApplicationRecord
	belongs_to:auth_bundle_type
	has_many :auth_bundle2obj


	def objs
		list = []
		self.auth_bundle2obj.each do |v|
			t = {}

			obj = v['auth_obj_model_name'].constantize.where(:id => v.auth_obj_id).first
			if obj
				t[:bundleobj] = v
				t[:orgobj] = obj
				list << t
			end
		end


		list
	end

end
