class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def is_admin_user?
    redirect_to root_path unless current_user.is_admin?
  end
  
end
