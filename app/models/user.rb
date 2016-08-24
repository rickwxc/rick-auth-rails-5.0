class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
		:omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter, :linkedin]

	#create / update meta content
	def save_meta(provider, meta_str)
		um = Um.find_or_initialize_by(:user_id => self.id, :provider => provider)
		um.update_attributes!(
			:content => meta_str,
			:updated_at => Time.now
		)

		um
	end

	#add key and value to existing meta field, no delete.
	def update_meta(provider, kvs)
		um = Um.find_or_initialize_by(:user_id => self.id, :provider => provider)
		hash = um.content.present??  (JSON.parse(um.content)):Hash.new;

		kvs.each do |k,v |
			hash[k] = v
		end

		um = save_meta(provider, hash.to_json.to_s)

		um
	end

	#load or create user from 3rd party's email
	def self.from_omniauth_email(email)

		user = User.where(:email => email).first

		unless user
			user = User.create(
				email: email,
				password: Devise.friendly_token[0,20]
			)
		end

		user
	end


end
