class Adm::AdmController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 


	def index
	end

	def importer
        if params['authenticity_token'] && current_user.id == 1
			md = params[:md]

			cnt = params[:cnt]
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

        if params['authenticity_token']

            @u.del_all_relations(User2position)

            params['pos'].each do |pid|
                @u.add_relation(User2position, 'position_id', pid)
            end if params['pos']

            redirect_to adm_ad_user_path(@u.id), notice: 'user updated.'
        end

        @position_ids = @u.get_all_relations_ids(User2position,:position_id)

	end




	def users
        @users = User.order('id desc').paginate(:page => params[:page], :per_page => 10)
    end

end

