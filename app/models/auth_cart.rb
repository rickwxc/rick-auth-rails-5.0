class AuthCart < ApplicationRecord

	def self.link_cart_obj_to_uc(user, visitor_uuid)
		if !user
			return
		end

		cs = AuthCart.find_by_sql ["select * from auth_carts where auth_user_id is null and  auth_visitor_uuid = ? ", visitor_uuid]
		cs.each do |v|
			v.auth_user_id = user.id
			v.save
		end
	end

	def self.get_item_list(user, visitor_uuid)
		rs = []
		if user
			self.link_cart_obj_to_uc(user, visitor_uuid)
			rs = AuthCart.where(:auth_user_id =>  user.id)
		else
			rs = AuthCart.where(:auth_visitor_uuid =>  visitor_uuid)
		end
		t = []
		rs.each do |cart_it|
			obj = cart_it.auth_obj_model_name.constantize.where(:id => cart_it.auth_obj_id).first
			if !obj || obj.auth_disabled_for_checkout
				cart_it.destroy
				next
			end
			o = {
				:cart_obj_id => cart_it.id,
				:obj => obj,
				:qty => cart_it.auth_obj_qty,
				:total => (cart_it.auth_obj_qty * obj.auth_obj_unitprice).round(2),
				:metas => cart_it.metas
			}

			t << o
		end

		t
	end


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
