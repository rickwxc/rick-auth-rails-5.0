class MyController < ApplicationController
	before_filter :authenticate_user!


	def index

		@u = User.find(current_user.id)

	end


end
