class LabController < ApplicationController

	def lab_addr_google

	end

	def lab_shopping
		@carts = AuthCart::get_item_list(current_user,g_get_visitor_uuid)
	end


end
