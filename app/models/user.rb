class User < ApplicationRecord
	belongs_to :role

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
		:omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter, :linkedin]

	def save_meta(provider, meta_str)

		Um.find_or_initialize_by(:user_id => self.id, :provider => provider).update_attributes!(
			:content => meta_str,
			:updated_at => Time.now
		)
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
