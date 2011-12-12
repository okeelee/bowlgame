class PicksController < ApplicationController
  before_filter :get_user
  
  # show the picks for the user allow editing if that user is the current one
  def user_picks
     @bowl_games = BowlGame.includes([:picks,:teams]).where(:picks=>{:user_id=>@user.id})
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # update the picks for the user if that user is the current user
  def update_user_picks
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
  
  private
  
  def get_user
    @user = User.where({:username=>params[:username]}).first
    @allow_edit = (@user==current_user) ? true : false
  end
end
