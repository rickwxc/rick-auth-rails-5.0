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

	  current_user.user2positions.each do |pos|
		  pos.position.position2permissions.each do |per|
			  if current_controller_name == per.permission.controllername 
				  return
			  end
		  end
	  end

	  redirect_to root_path
  end

end
