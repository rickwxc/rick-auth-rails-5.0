class AuthOrder < ApplicationRecord
	belongs_to:auth_orderst
	belongs_to:auth_payst

	def self.init_order(user_id, uuid)
		o = AuthOrder.new
		o.auth_user_id = user_id
		o.auth_visitor_uuid = uuid

		o.auth_orderst_id = AuthOrderst::Draft
		o.auth_payst_id = AuthPayst::Not_Paid
		o.save

		o
	end

	def refund(paymethod_id, txn_uuid, gross_f, fee_f)

		inv = AuthInvoice.new
		inv.uuid = txn_uuid
		inv.gross = gross_f
		inv.fee = fee_f
		inv.auth_order_id = self.id
		inv.auth_paymethod_id = paymethod_id
		inv.auth_invoicest_id = AuthInvoicest::Refund
		inv.save

		if gross_f < self.auth_total.to_i - 1 
			#amount not match
			self.auth_payst_id = AuthPayst::Half_Paid
			self.save
			return
		end

		self.auth_payst_id = AuthPayst::Refund
		self.auth_orderst_id = AuthOrderst::Cancelled
		self.save
	end

	def paid(paymethod_id, txn_uuid, gross_f, fee_f)

		#save payment info
		#auth_paymethod_id
		
		inv = AuthInvoice.new
		inv.uuid = txn_uuid
		inv.gross = gross_f
		inv.fee = fee_f
		inv.auth_order_id = self.id
		inv.auth_paymethod_id = paymethod_id
		inv.auth_invoicest_id = AuthInvoicest::Paid
		inv.save
		
		if gross_f < self.auth_total.to_i - 1 
			#amount not match
			self.auth_payst_id = AuthPayst::Half_Paid
			self.auth_orderst_id = AuthOrderst::Valid
			self.save
			return
		end

		self.auth_payst_id = AuthPayst::Paid
		self.auth_orderst_id = AuthOrderst::Valid
		self.save
	end

end
