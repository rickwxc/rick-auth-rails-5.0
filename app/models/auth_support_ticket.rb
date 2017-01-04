class AuthSupportTicket < ApplicationRecord
	belongs_to :auth_reasonst
	belongs_to :auth_reason
end
