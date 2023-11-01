class ApplicationController < ActionController::Base
  helper_method :current_user 
 
  def current_user 
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def require_user 
    redirect_to '/login' unless current_user 
  end 
  
  def authorize_user(resource)
    unless resource.user == current_user
      redirect_to resource.class.to_s.downcase.pluralize, alert: 'You are not authorized to perform this action.'
    end
  end
  
  def require_admin
	  redirect_to '/' unless current_user.admin?
	end

end
