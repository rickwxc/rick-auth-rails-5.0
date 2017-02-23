class AuthSelShippingrule < ApplicationRecord

	def self.load_shipping_cost(arg_model)
		rs = AuthSelShippingrule.find_by_sql ["select * from auth_sel_shippingrules r join auth_shippingrule2objs  o on r.id = o.auth_sel_shippingrule_id where model =? ", arg_model]

		rs
	end

end
