class AuthInvoice < ApplicationRecord
	belongs_to:auth_paymethod
	belongs_to:auth_invoicest
end
