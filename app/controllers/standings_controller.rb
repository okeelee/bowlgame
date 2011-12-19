class StandingsController < ApplicationController
  
  def index
    @users = User.includes([{:picks=>[:bowl_game,:team]}]).where(:paid=>true).order("users.score desc")
    
    @user_teams = current_user.picks.collect{|p| p.team_id}
    
    @bowl_games = BowlGame.includes([:teams]).where({:pickem_id=>@pickem.id}).order("game_time asc")
    
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
