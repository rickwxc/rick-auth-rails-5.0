class Adm::AdmController < ApplicationController
	skip_before_action :verify_authenticity_token
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 


	def index
	end

	def ajax_updater
		rs = {}
		id = params[:id].to_i
		field = params[:field]
		value = params[:value]
		obj = params[:model].constantize.find(id)
		obj[field] = value
		obj.save

		rs[:new_value] = obj[field]
		rs[:ok] = 1

		render :json => rs
	end


	def csv 
		require 'csv'
		s = ''
		name = params[:name]
		objs = name.constantize.all

		if  current_user.id == 1
			i = 0
			objs.each do |obj|
				if i == 0
					obj.attributes.each do |k, v|
						s = s +  '|' + k.to_s
					end
					s  = s + "\n" 
				end

				obj.attributes.each do |k, v|
					s = s +  '|' + v.to_s
				end
				s = s + "\n" 
				i =  i + 1
			end
		end

		render :plain => s
	end

	def importer
        if params['authenticity_token'] && current_user.id == 1
			md = params[:md]

			cnt = params[:cnt]

			if cnt == 'csv'
				redirect_to adm_csv_path(:name => md)
				return
			end


			lines = cnt.split(/\r\n/)


			i = 0
			fields = nil
			lines.each do |r|
				r.strip!
				if r == ''
					next
				end

				row = r.split(/\|/)
				i = i + 1

				if i == 1
					fields = row
					next
				end

				obj = md.constantize.new
				fields.each_with_index do |v, i|
					obj[v.to_sym] = row[i]
					obj.save
				end

			end
			
			
            redirect_to adm_importer_path(), notice: 'Done!'
        end

	end

    def user
        id = params[:user_id]
        @u = User.find(id)

		@profile =  Profile.get_profile(@u.id)

        if params['authenticity_token']

            @u.del_all_relations(User2position)

            params['pos'].each do |pid|
                @u.add_relation(User2position, 'position_id', pid)
            end if params['pos']

			params.each do |f|
				if @profile.has_attribute?(f)
					@profile[f] = params[f]
				end
			end

			@profile.save


            redirect_to adm_ad_user_path(@u.id), notice: 'user updated.'
        end

        @position_ids = @u.get_all_relations_ids(User2position,:position_id)

	end


	def add_by_email
		email = params[:email]

		u = User.from_omniauth_email(email)
		UserMailer.account_password_email(u).deliver_now

		rs = {
			:id => u.id
		}

		render :json => rs
	end


	def users
        @users = User.order('id desc').paginate(:page => params[:page], :per_page => 10)
    end

end

