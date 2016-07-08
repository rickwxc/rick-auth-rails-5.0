class MyController < ApplicationController
	before_filter :authenticate_user!


	def index

		@u = User.find(current_user.id)
		UserMailer.welcome_email(@u)
		
		#email = mail from: ENV['MAILGUN_SENDER'], to: @u.email, subject: 'this is an email'

	end


end
