class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def self.define_cb(provider) 
		define_method(provider) do
			access_token = request.env["omniauth.auth"]
			info = access_token.info
			email = info["email"]
			user = User.from_omniauth_email(email)

			if user.persisted?
				user.save_meta(provider, info.to_json.to_s)
				sign_in_and_redirect user, event: :authentication, path:my_path
			else
				render :text => ( provider + " login failed.")
			end

		end 
	end

  define_cb :facebook
  define_cb :linkedin
  define_cb :google_oauth2 

  def twitter
	  access_token = request.env["omniauth.auth"]
	  info =  access_token.info 
	  #twitter no email provided! 

      user = User.from_omniauth_email(info.nickname.to_s + "@fakemail.twitter.com")

	  if user.persisted?

		  user.save_meta('twitter', info.to_json.to_s)
		
	      sign_in_and_redirect user, event: :authentication, path:my_path
	  else
		  render :text => "twitter login failed."
	  end

  end

end
