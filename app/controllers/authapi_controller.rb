class AuthapiController < ApplicationController


	def auth_save_addr
		rs = {}

		street_number = params['street_number']
		street = params['route']
		zip = params['postal_code']
		raw = params['autocomplete']

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
		addr.street_number = street_number
		addr.street = street
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
