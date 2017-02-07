class AuthOrder < ApplicationRecord
	belongs_to:auth_orderst
	belongs_to:auth_payst
	
	def self.get_price_with_out_gst_from_total(amt)
		p = amt/1.1 

		p
	end

	def self.get_gst_from_total(amt)
		gst = amt/11 

		gst
	end

	def add_order_item(obj, qty, meta)
		qty = qty.to_f.round(2)

		orderobj = AuthOrder2obj.new
		orderobj.auth_order_id = self.id

		sub_total = (obj.auth_total * qty).round(2)

		orderobj.auth_total = sub_total
		orderobj.auth_gst = AuthOrder.get_gst_from_total(sub_total)

		orderobj.auth_obj_id = obj.id
		orderobj.auth_obj_model_name = obj.class.name
		orderobj.auth_obj_display_name = obj.auth_obj_display_name
		orderobj.auth_obj_qty = qty
		orderobj.auth_obj_unitprice = obj.auth_total
		if meta
			orderobj.auth_obj_meta_json = meta.to_json
		end

		orderobj.save

		orderobj
	end

	def save_order_meta(k, v)
		#todo implemented by each application.
	end

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
		
		if self.auth_payst_id == AuthPayst::Paid || self.auth_payst_id = AuthPayst::Half_Paid
			return
		end
		
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
