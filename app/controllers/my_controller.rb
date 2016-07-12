class MyController < ApplicationController
	before_action :authenticate_user!


	def index

		@u = User.find(current_user.id)

	end


end
