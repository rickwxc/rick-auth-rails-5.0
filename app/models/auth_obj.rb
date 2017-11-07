class AuthObj < ApplicationRecord

	def auth_obj_display_name
		self.auth_name
	end

	def auth_obj_get_discount
		#todo: check website discount
		
		#d = AuthDiscount.has_discount(website.class.name, website.id)
		#if d return d end
		
		#check tag discount
		
		d = AuthTag.get_discount(self)
		if d
			return d
		end

		false
	end

	def auth_obj_unitprice_before_discount
		self.auth_unitprice
	end

	def auth_obj_unitprice
		up = self.auth_unitprice

		dis = self.auth_obj_get_discount
		if dis
			up = (up * dis.amt).round(2)
		end

		up
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

	def auth_get_top_category_name
		tag = (AuthTag.find_by_sql ["select t.* from auth_tag2objs t2o join  auth_tags t on t2o.auth_tag_id = t.id  and t2o.model = ? and  t2o.auth_obj_id = ? order by t.id desc", 'AuthObj', self.id]).first

		if tag
			return tag.name
		end

		return ''
	end

end

