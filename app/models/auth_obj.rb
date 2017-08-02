class AuthObj < ApplicationRecord

	def auth_obj_display_name
		self.auth_name
	end

	def auth_obj_unitprice
		self.auth_unitprice
	end

	def auth_disabled_for_checkout
		return self.auth_is_disabled == true
	end

	def auth_get_stock
		self.stock_qty
	end

	def auth_set_stock(qty)
		self.stock_qty = qty
		self.save
	end

	def auth_is_presale
		if !self.in_stock_date
			return false
		end

		Time.zone = 'Sydney'
		self.in_stock_date.future?
	end


end
