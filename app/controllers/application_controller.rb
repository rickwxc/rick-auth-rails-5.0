class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init_env


  def can_current_user_access(current_controller_name)
	  if !current_user.present? 
		  redirect_to root_path
		  return
	  end

	  if current_user.id == 1 
		  return
	  end

      cn = current_controller_name
      cn1 = current_controller_name.gsub '_', ''
      cn2 = current_controller_name.gsub '/', '::'

      current_user.user2positions.each do |u2p|
          cs = u2p.position.get_controllernames
          if (cs.include? cn) || (cs.include? cn1) || (cs.include? cn2)
              return
          end 
      end 

	  redirect_to root_path
  end

	def g_get_visitor_uuid

		if cookies[:visitor_uuid].present?
			return cookies[:visitor_uuid]
		else
			visitor_uuid = Digest::SHA1.hexdigest ((Time.now.to_s + rand(1 .. 500).to_s))
			cookies[:visitor_uuid] = {value: visitor_uuid, expires: 1000.day.from_now }
			return visitor_uuid
		end
	end

	def init_env
		#tobe implemented
	end

end
