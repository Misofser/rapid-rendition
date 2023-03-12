class ApplicationController < ActionController::Base
  helper_method :current_user 
 
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  def require_user 
    redirect_to '/login' unless current_user 
  end 
  
  def authorize_user
    unless @sketch.user == current_user
      redirect_to sketches_path, alert: 'You are not authorized to perform this action.'
    end
  end
  
  def require_admin
	  redirect_to '/' unless current_user.admin?
	end

end
