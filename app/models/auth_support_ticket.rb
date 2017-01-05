class AuthSupportTicket < ApplicationRecord
	belongs_to :auth_reasonst
	belongs_to :auth_reason

	def show_meta

		m = JSON.parse(self.meta)

		str = ""
		m.each do |v, k|
			if k && k != ''
				str = str + v + ":" + k + "<br />"
			end
		end

		str
	end

end
