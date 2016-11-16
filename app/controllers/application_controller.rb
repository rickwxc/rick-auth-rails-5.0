class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def can_current_user_access(current_controller_name)
	  if !current_user.present? 
		  redirect_to root_path
		  return
	  end

	  if current_user.id == 1 
		  return
	  end

	  cn = current_controller_name
	  cn2 = current_controller_name.sub '/', '::'

	  current_user.user2positions.each do |u2p|
		  cs = u2p.position.get_controllernames
		  if (cs.include? cn) || (cs.include? cn2)
			  return
		  end
	  end

	  redirect_to root_path
  end

end
