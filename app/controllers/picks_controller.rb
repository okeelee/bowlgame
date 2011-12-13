class PicksController < ApplicationController
  before_filter :get_user
  
  # show the picks for the user allow editing if that user is the current one
  def user_picks
    @picks = Pick.includes([{:bowl_game=>[{:teams=>[:conference]}]}]).where({:user_id=>@user.id}).order('picks.points desc')
    
    respond_to do |format|
      format.html # index.html.erb
      format.js { render json: @picks }
    end
  end
  
  # update the picks for the user if that user is the current user
  def update_user_picks
    @picks = Pick.where({:user_id=>@user.id}).order('picks.points desc')
    
    points = []
    teams = []
    pick_ids = []
    params[:picks].each do |pick_id, pick_data|
      pick_ids << pick_id.to_i
      points << "WHEN #{pick_id.to_i} THEN #{pick_data['points'].to_i}"
      teams << "WHEN #{pick_id.to_i} THEN #{pick_data['team_id'].to_i}"
    end
    # Do the update as one big query to speed it up
    sql = "UPDATE picks SET points = CASE id #{points.join(' ')} END, "
    sql += "team_id = CASE id #{teams.join(' ')} END "
    sql += "WHERE id IN(#{pick_ids.join(',')})"
    ActiveRecord::Base.connection.execute sql
    
    
    respond_to do |format|
      format.html { redirect_to user_picks_path(@user.username) }
      format.js { render json: true }
    end
  end
  
  private
  
  def get_user
    @user = User.where({:username=>params[:username]}).first
    @allow_edit = (@user==current_user) ? true : false
  end
end
