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

end
