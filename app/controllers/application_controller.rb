class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_pickem, :authenticate_user!, :prepare_for_mobile
  
  def is_admin_user?
    redirect_to root_path unless current_user.is_admin?
  end
  
  protected
  
  def get_pickem
    @pickem = Pickem.find(PICKEM_ID) || Pickem.new
  end
  
  private
  
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|WP7|webOS/
    end
  end
  helper_method :mobile_device?
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end
end
