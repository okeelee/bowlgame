class StandingsController < ApplicationController
  
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
