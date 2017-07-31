class AuthObjAttr < ApplicationRecord
	belongs_to:auth_obj_attr_type

	def self.load_attrs(obj_id, modelname)
	  rs = AuthObjAttr.where(:model => modelname, :obj_id => obj_id).order('idx desc')

	  rs
	end

end
