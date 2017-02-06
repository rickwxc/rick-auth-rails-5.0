class AuthapiController < ApplicationController

	def auth_gene_order_for_payment
		rs = {}

		order_meta_keys = params['order_meta_keys']

		auth_visitor_uuid = '' #todo, load form cookie.

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
		rs = {}

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

		rs['id'] = addr.id
		rs['full'] = addr.full

		render :json => rs
	end

end
