class AuthapiController < ApplicationController


	def auth_rm_obj_from_cart
		rs = {}

		auth_visitor_uuid = g_get_visitor_uuid

		id = params['cart_obj_id']
		if id
			AuthCart.where(:id => id, :auth_visitor_uuid => auth_visitor_uuid).destroy_all
			if current_user
				AuthCart.where(:id => id, :auth_user_id => current_user.id).destroy_all
			end
		end

		ids = params['cart_obj_ids']
		if ids
			AuthCart.where(:auth_visitor_uuid => auth_visitor_uuid).where(id: ids).destroy_all

			if current_user
				AuthCart.where(:auth_user_id => current_user.id).where(id: ids).destroy_all
			end
		end

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
		if params['options_json']
			c.auth_obj_meta_json = params['options_json'].to_json
		end

		c.save

		render :json => rs
	end

	def auth_gene_order_by_params
		auth_visitor_uuid = g_get_visitor_uuid

		uc = nil
		if current_user
			uc = current_user
		elsif params['email']
			uc = User.from_omniauth_email(params['email'])
		end

		if uc
			o = AuthOrder.init_order(uc.id, auth_visitor_uuid)
		else
			o = AuthOrder.init_order(0, auth_visitor_uuid)
		end

		if params['billing_addr']
			billing_addr = auth_save_user_addr_from_params('billing_')
			o.billing_addr_id = billing_addr.id
		end

		if params['shipping_addr']
			shipping_addr = auth_save_user_addr_from_params('shipping_')
			o.shipping_addr_id = shipping_addr.id
		end


		if params['order_meta_keys']
			self.auth_save_order_meta(params['order_meta_keys'], o)
		end

		if params['shipping_rule_id']
			self.auth_shipping_cacul(o)
		end

		if params['items']
			self.auth_save_order_items(o)
		elsif params['cart_items']
			self.auth_save_order_items_from_cart(o)
		end



		if params['note']
			o.auth_note = params['note']
		end
		o.save

		o
	end

	def auth_shipping_cacul(o)
		shipping_rule_id = params['shipping_rule_id'].to_i
		r = AuthSelShippingrule.where(:id =>shipping_rule_id).first 
		if !r
			return
		end

		o.auth_shipping_cost = r.cost

		if o.auth_total 
			o.auth_total = o.auth_total + o.auth_shipping_cost
		else
			o.auth_total = o.auth_shipping_cost
		end
		o.save
	end

	def auth_get_order_shipping_cost
		rs = {}

		order_id = params['order_id']
		o = AuthOrder.find(order_id)

		#tobe implemented

		rs['auth_order_id'] = o.id
		rs['auth_shipping_cost'] = o.auth_shipping_cost

		render :json => rs
	end

	def auth_gene_order_for_payment
		rs = {}

		o = self.auth_gene_order_by_params

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
			meta = item['meta'].to_s
			if obj
				objitem = order.add_order_item(obj, qty, meta)
				gst = gst + objitem.auth_gst 
				total =  total + objitem.auth_total
			end
		end

		if order.auth_total 
			order.auth_total = order.auth_total + total
		else
			order.auth_total = total
		end
		order.auth_gst = AuthOrder.get_gst_from_total(order.auth_total)
		order.save
	end


	def auth_save_order_items_from_cart (order)
		items = params['cart_items']
		total = 0
		gst = 0
		items.each do |cart_obj_id|
			ac = AuthCart.where(:id => cart_obj_id).first
			if !ac
				next
			end

			obj = ac.obj

			if !obj
				next
			end

			objitem = order.add_order_item(obj, ac.auth_obj_qty, ac.auth_obj_meta_json)
			gst = gst + objitem.auth_gst 
			total =  total + objitem.auth_total
		end

		if order.auth_total 
			order.auth_total = order.auth_total + total
		else
			order.auth_total = total
		end
		order.auth_gst = AuthOrder.get_gst_from_total(order.auth_total)
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
		ucaddr = auth_save_user_addr_from_params('')
		rs = {}
		rs['uc_addr_id'] = ucaddr.id
		rs['full'] = ucaddr.full

		render :json => rs
	end

	def auth_save_user_addr_from_params(prefix)
		addr_id = 0
		if params["#{prefix}addr_id"]
			addr_id = params["#{prefix}addr_id"].to_i
		else
			addr = self.auth_save_addr_from_params
			addr_id = addr.id
		end


		user_addr_type_id = params["#{prefix}auth_user_addr_type_id"].to_i
		ucaddr = nil
		if current_user
			ucaddr = AuthUserAddr.find_or_create_by(:auth_user_id => current_user.id, :auth_addr_id => addr_id,:auth_user_addr_type_id => user_addr_type_id,:is_not_used=>false)
		else
			ucaddr = AuthUserAddr.new
		end

		ucaddr.auth_user_addr_type_id = user_addr_type_id
		ucaddr.auth_visitor_uuid = g_get_visitor_uuid
		ucaddr.auth_addr_id = addr_id
		ucaddr.is_not_used = false

		if params["#{prefix}firstname"]
			ucaddr.firstname = params["#{prefix}firstname"].strip
		end

		if params["#{prefix}lastname"]
			ucaddr.lastname = params["#{prefix}lastname"].strip
		end

		if params["#{prefix}mobile"]
			ucaddr.mobile = params["#{prefix}mobile"].strip
		end

		if params["#{prefix}company"]
			ucaddr.company = params["#{prefix}company"].strip
		end

		ucaddr.save

		ucaddr
	end

	def auth_save_addr_from_params

		if params['auth_addr_org'] 
			addr = AuthAddr.new
			addr.org = params['auth_addr_org'].strip
			addr.save
			return addr
		end

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


	def auth_item_count_in_cart
		rs = AuthCart::get_item_list(current_user,g_get_visitor_uuid)

		rs = {
			:cart_items => rs.length
		}

		render :json => rs
	end

	def auth_user_addr_is_not_used
		user_addr_id = params[:user_addr_id]
		user_addr = AuthUserAddr.find(user_addr_id)
		rs = {}
		if !current_user
			render :json => rs
			return
		end

		if current_user.id == user_addr.auth_user_id
			user_addr.is_not_used = true
			user_addr.save
		end

		render :json => rs
	end


end
