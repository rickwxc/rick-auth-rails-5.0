class Adm::AdmController < ApplicationController
	layout 'adm'
	before_action :authenticate_user!
	before_action -> {can_current_user_access(params[:controller]) } 


	def index
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

