class Authecom::AuthecomController < ApplicationController
	include OffsitePayments::Integrations
	skip_before_action :verify_authenticity_token

	def index
		#order = AuthOrder.find(1)
		#order.paid(AuthPaymethod::Paypal, 'KZKDAJERKZDE', 101.3, 2.3)
		#order.refund(AuthPaymethod::Paypal, 'KZKDAJERKZDE49', 51.3, 2.3)
	end

	def pay
		order_id = params['order_id']
		@order = AuthOrder.where(:id => order_id.to_i).first
	end


	def paypalipn
		render :nothing => true

		Rails.logger.info "IPN here"

		@ipn = Paypal::Notification.new(request.raw_post)

		if !@ipn.acknowledge
			Rails.logger.info "not ack"
			return
		end

		inv = @ipn.invoice

		order_id = inv
		if inv.include? "_"
			invs = inv.split '_'
			order_id = invs[1] 
		end

		order = AuthOrder.find(order_id)

		uuid = @ipn.transaction_id

		Rails.logger.info "acked"
		Rails.logger.info @ipn.status 
		if @ipn.status == 'Refunded'
			Rails.logger.info "refunded"
			order.refund(AuthPaymethod::Paypal, uuid, @ipn.gross.to_f, @ipn.fee.to_f)
			return
		end

		if !@ipn.complete?
			Rails.logger.info  'not complete' 
			return
		end

		order.paid(AuthPaymethod::Paypal, uuid, @ipn.gross.to_f, @ipn.fee.to_f)

		#note = "Transaction ID: " + @ipn.transaction_id.to_s
		#note = note + "\r\n Received at:" + @ipn.received_at.to_s

		#inv.paid(Paytype::Online, Paymethod::Paypal, @ipn.gross.to_f, @ipn.fee.to_f, note)

		#UserMailer.order_email(order).deliver
		#UserMailer.admin_order_email(order).deliver
	end

end
