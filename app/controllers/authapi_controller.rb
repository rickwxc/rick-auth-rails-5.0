class AuthapiController < ApplicationController


	def auth_rm_obj_from_cart
		rs = {}

		id = params['cart_obj_id']
		auth_visitor_uuid = g_get_visitor_uuid

		AuthCart.where(:id => id, :auth_visitor_uuid => auth_visitor_uuid).destroy_all
		render :json => rs
	end

	def auth_update_obj_qty_in_cart
		rs = {}

		id = params['cart_obj_id']
		qty = params['qty'].to_f
		auth_visitor_uuid = g_get_visitor_uuid

		if qty < 0.1
			render :json => rs
			return
		end

		c = AuthCart.where(:id => id, :auth_visitor_uuid => auth_visitor_uuid).first
		if c
			c.auth_obj_qty = qty
			c.save
		end

		render :json => rs
	end
	
	def auth_add_obj_to_cart
		rs = {}

		c = AuthCart.new

		if current_user
			c.auth_user_id = current_user.id
		end
		c.auth_visitor_uuid = g_get_visitor_uuid
		c.auth_obj_id = params['id']
		c.auth_obj_model_name = params['model']
		c.auth_obj_qty = params['qty']
		c.auth_obj_meta_json = params['options_json'].to_json

		c.save

		render :json => rs
	end

	def auth_gene_order_for_payment
		rs = {}

		order_meta_keys = params['order_meta_keys']

		auth_visitor_uuid = g_get_visitor_uuid

		email = params['email']
		uc = User.from_omniauth_email(email)
		o = AuthOrder.init_order(uc.id, auth_visitor_uuid)

		self.auth_save_order_meta(order_meta_keys, o)
		self.auth_save_order_items(o)

		o.auth_note = params['note']
		o.save

		rs['auth_order_id'] = o.id
		rs['auth_total'] = o.auth_total

		render :json => rs
	end

	def auth_save_order_meta (meta_keys, order)
		meta_keys.each do |k|
			order.save_order_meta(k, params[k].strip)
		end
	end

	def auth_save_order_items (order)
		items = params['items']
		total = 0
		gst = 0
		items.each do |k, item|
			id = item['id']
			qty = item['qty'].to_f
			obj = item['model'].constantize.where(:id => id).first
			if obj
				objitem = order.add_order_item(obj, qty, nil)
				gst = gst + objitem.auth_gst 
				total =  total + objitem.auth_total
			end
		end

		order.auth_total =  total
		order.auth_gst = gst
		order.save
	end

	def auth_save_addr
		addr = self.auth_save_addr_from_params

		rs = {}
		rs['id'] = addr.id
		rs['full'] = addr.full

		render :json => rs
	end

	def auth_save_user_addr
		addr_id = 0
		if params['addr_id']
			addr_id = params['addr_id'].to_i
		else
			addr = self.auth_save_addr_from_params
			addr_id = addr.id
		end

		ucaddr = AuthUserAddr.new
		if current_user
			ucaddr.auth_user_id = current_user.id
		end

		ucaddr.auth_user_addr_type_id = params['auth_user_addr_type_id'].to_i
		ucaddr.auth_visitor_uuid = g_get_visitor_uuid
		ucaddr.auth_addr_id = addr_id

		ucaddr.firstname = params['firstname']
		ucaddr.lastname = params['lastname']
		ucaddr.mobile = params['mobile']
		ucaddr.company = params['company']
		ucaddr.save

		rs = {}
		rs['uc_addr_id'] = ucaddr.id
		rs['full'] = addr.full

		render :json => rs
	end

	def auth_save_addr_from_params
		street_number = params['street_number']
		street = params['route']
		zip = params['postal_code']
		raw = params['autocomplete']
		unit_no = params['unit_no']


		sb = params['locality']
		st = params['administrative_area_level_1']

		gj = params['country']
		gj = AuthGj.find_or_initialize_by(:name => gj.strip)
		gj.save

		st = AuthSt.find_or_initialize_by(:name => st.strip, :auth_gj_id => gj.id )
		st.save

		sb = AuthSb.find_or_initialize_by(:name => sb.strip, :zip => zip.strip, :auth_st_id => st.id )
		sb.save

		addr = AuthAddr.new

		addr.unit_no = unit_no.strip
		addr.street_number = street_number.strip
		addr.street = street.strip
		addr.auth_sb_id = sb.id

		params.delete('controller')
		params.delete('action')
		addr.raw_json = params.to_json
		addr.org = raw

		addr.save

		addr
	end

end
