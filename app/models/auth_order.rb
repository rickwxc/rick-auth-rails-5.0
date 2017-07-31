class AuthOrder < ApplicationRecord
	belongs_to:auth_orderst
	belongs_to:auth_payst
	belongs_to :user, class_name: 'User', foreign_key: 'auth_user_id', :optional => true
	has_many :auth_order2objs

	belongs_to :billing_addr, class_name: 'AuthUserAddr', foreign_key: 'billing_addr_id', :optional => true
	belongs_to :shipping_addr, class_name: 'AuthUserAddr', foreign_key: 'shipping_addr_id', :optional => true

	def shipping_str
		if self.shipping_addr 
			return self.shipping_addr.full 
		end

		''
	end

	def billing_str
		if self.billing_addr 
			return self.billing_addr.full 
		end

		''
	end
	
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

		sub_total = (obj.auth_obj_unitprice * qty).round(2)

		orderobj.auth_total = sub_total
		orderobj.auth_gst = AuthOrder.get_gst_from_total(sub_total)

		orderobj.auth_obj_id = obj.id
		orderobj.auth_obj_model_name = obj.class.name

		if obj.has_attribute?(:auth_uuid) || (obj.respond_to? :auth_uuid)
			orderobj.uuid = obj.auth_uuid
		end

		if obj.has_attribute?(:barcode) || (obj.respond_to? :barcode)
			orderobj.barcode = obj.barcode
		end

		orderobj.auth_obj_display_name = obj.auth_obj_display_name
		orderobj.auth_obj_qty = qty
		orderobj.auth_obj_unitprice = obj.auth_obj_unitprice
		if meta
			orderobj.auth_obj_meta_json = meta
		end

		orderobj.save

		orderobj
	end

	def save_order_meta(k, v)
		js = {}
		if self.auth_meta_json 
			js = JSON.parse self.auth_meta_json
		end
		js[k] = v

		self.auth_meta_json = js.to_json

		self.save
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

		if gross_f.abs < self.auth_total.to_i - 1 
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
		
		if self.auth_payst_id == AuthPayst::Paid || self.auth_payst_id == AuthPayst::Half_Paid
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
			self.after_order_paid
			return
		end

		self.auth_payst_id = AuthPayst::Paid
		self.auth_orderst_id = AuthOrderst::Valid
		self.save

		self.after_order_paid
	end

	def after_order_paid
		self.clear_cart_items
		self.dec_item_stock 
	end

	def clear_cart_items
		self.auth_order2objs.each  do |v| 
			AuthCart.delete_all(["auth_user_id =? and auth_obj_id = ? and  auth_obj_model_name = ?", self.auth_user_id, v.auth_obj_id, v.auth_obj_model_name])
		end
	end

	def dec_item_stock 
		self.auth_order2objs.each  do |v| 
			obj = v.obj
			if obj && obj.respond_to?(:auth_get_stock) && obj.respond_to?(:auth_set_stock)
				qty = obj.auth_get_stock
				if qty > 0
					new_stock_qty = qty - v.auth_obj_qty
					obj.auth_set_stock(new_stock_qty)
				end
			end
		end
	end

end
