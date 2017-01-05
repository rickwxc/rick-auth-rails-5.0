class WeController < ApplicationController


	def index

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

	def auth_support_ticket_add

        email = params[:email]
        mobile = params[:mobile]
        note = params[:note]
        auth_reason_id = params[:auth_reason_id]

		keys = [:email, :mobile, :note,:auth_reason_id, :controller, :action]

		meta = {}
		params.each do |k,v|
			if keys.include? k.to_sym
				next
			end
			meta[k] = v
		end

		ast = AuthSupportTicket.new
		ast.email = email
		ast.mobile = mobile
		ast.note = note
		ast.meta = meta.to_json
		ast.auth_reason_id = auth_reason_id
		ast.auth_reasonst_id = 1
		if current_user
			ast.user_id = current_user.id
		end
		ast.save

		rs = {
			'rs' => 1
		}

		render :json => rs
	end

end
