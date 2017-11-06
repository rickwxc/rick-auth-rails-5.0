class AuthDiscount < ApplicationRecord

	def self.has_discount(m, id)
		d = AuthDiscount.where(:model =>m, :obj_id => id).order('id desc').first

		d
	end
	
	def to_p_s
		v = (100 - 100 * self.amt).to_i

		(v.to_s + '%')
	end
	def to_s

		self.to_p_s + " off"
	end


end
