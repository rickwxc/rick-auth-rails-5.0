class WeController < ApplicationController


	def index

	end

    def login
        id = params[:user_id]
        code = params[:code]
        user = User.where(:id => id).first

        dbcode = user.login_code
        if code == dbcode
            sign_in_and_redirect user
        else
            redirect_to new_user_session_path
        end
    end


end
