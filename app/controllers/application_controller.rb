class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_pickem, :authenticate_user!
  
  def is_admin_user?
    redirect_to root_path unless current_user.is_admin?
  end
  
  protected
  
  def get_pickem
    @pickem = Pickem.find(PICKEM_ID) || Pickem.new
  end
  
end
