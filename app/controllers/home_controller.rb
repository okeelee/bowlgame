class HomeController < ApplicationController
  before_filter :get_user
  # GET /users
  # GET /users.json
  def index
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  private
  
  def get_user
    @user = User.where({:username=>params[:username]}).first
  end
end
