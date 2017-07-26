class Position < ApplicationRecord
	has_many :position2permissions
	AuthSuperAdmin = 1

	def get_controllernames
		rs = []

		self.position2permissions.each do |v|
			rs << v.controllername
		end

		rs
	end

end
