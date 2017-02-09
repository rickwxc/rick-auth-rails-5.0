class WeController < ApplicationController


	def index

		cart_list
	end
	
	def cart_list
		@carts = AuthCart::get_item_list(current_user,g_get_visitor_uuid)
	end

    def login
        id = params[:user_id]
        code = params[:code]
        url = params[:url]
        user = User.where(:id => id).first

        dbcode = user.login_code
        if code == dbcode
			if url
				sign_in user, event: :authentication 
				url = Base64.urlsafe_decode64(url)
				redirect_to url
			else
				sign_in_and_redirect user
			end
        else
            redirect_to new_user_session_path
        end
    end


end
