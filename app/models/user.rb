class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	No_relation = 0
	
	has_many :user2positions
	has_many :positions, through: :user2positions

	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable,
		:omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :twitter, :linkedin]

	def pf
		p = Profile.get_profile(self.id)

		p
	end

	def self.list_by_positions(position_id)
		rs = User.joins("INNER JOIN user2positions ON  users.id = user2positions.user_id").where(:user2positions => {:position_id => position_id})

		rs
	end

	def login_code
		code = Digest::SHA1.hexdigest (Rails.application.secrets.secret_key_base + self.email)

		code
	end

	#create / update meta content
	def save_meta(provider, meta_str)
		um = Um.find_or_initialize_by(:user_id => self.id, :provider => provider)
		um.update_attributes!(
			:content => meta_str,
			:updated_at => Time.now
		)

		um
	end

	#add key and value to existing meta field, store as array
	def update_meta(provider, kvs)
		um = Um.find_or_initialize_by(:user_id => self.id, :provider => provider)
		hash = um.content.present??  (JSON.parse(um.content)):Hash.new;

		kvs.each do |k,v|
			v = v.to_s
			if hash[k].present?
				cv = hash[k]
				if  !cv.include? v
					cv << v 
				end
				hash[k] = cv
			else
				hash[k] = [v]
			end
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


	def add_relation(relation_table, rel_field, rel_id)
		rs = relation_table.find_or_initialize_by(:user_id => self.id, rel_field => rel_id)
		rs.save

		rs
	end

	# current_user.has_relation(User2position, 'position_id', Position::Admin)
	# current_user.has_relation(User2position, 'position_id', User::No_relation)
	def has_relation(relation_table, rel_field, rel_id)
		if rel_id == User::No_relation
			ps = relation_table.where(:user_id => self.id).first
			if ps
				return false 
			end

			return true
		end

		ps = relation_table.where(:user_id => self.id, rel_field => rel_id).first
		if ps
			return true
		end

		false 
	end

    def del_all_relations(relation_table)
		relation_table.where(:user_id => self.id).destroy_all
    end

    def get_all_relations_ids(relation_table, rel_field)
        ps = relation_table.where(:user_id => self.id)
        ids = []
        ps.each do |v|
            ids << v[rel_field]
        end

        ids
    end

end
