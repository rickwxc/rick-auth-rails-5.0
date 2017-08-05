class AuthOrderShippingRule < ApplicationRecord

	def self.current_shipping_rules
		rules = AuthOrderShippingRule.where(:is_enabled => true)
		rules
	end

	def self.get_shipping_cost(order_total) 
		rules = self.current_shipping_rules 
		if rules.length == 0
			return 0
		end

		if rules.length == 1
			return rules[0].cost 
		end

		#todo: implement shipping cost based on multi rules
		return 0
	end

	def is_free_shipping(total)
		if self.order_amt.to_i > 0 &&  total.to_i >= self.order_amt.to_i 
			return true
		end

		return false
	end

	def cost_info(total)
		if self.is_free_shipping(total)
			return '(Free shipping)'
		end

		s = "$#{self.cost}"

		if self.order_amt.to_i > 0 
			x =  self.order_amt.to_i  - total.to_i 
			s = s + " ($#{x} away from Free Shipping)" 
		end

		return s
	end

end
