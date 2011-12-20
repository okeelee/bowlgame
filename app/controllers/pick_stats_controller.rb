class PickStat
  attr_reader :count, :avg, :max, :min, :total, :bowl_name, :team_id, :team_name
  attr_writer :count, :avg, :max, :min, :total
  
  def initialize(bowl_name, team_id, team_name)
    @bowl_name = bowl_name
    @team_id = team_id
    @team_name = team_name
  end
end

class PickStatsController < ApplicationController
  def index
    @bowl_games = BowlGame.includes([:teams]).order('game_time');
    
    @pick_stats = []
    @bowl_games.each do |bowl_game|
      bowl_game.teams.each do |team|
        ps = PickStat.new(bowl_game.name, team.espn_id, team.school_name)
        ps.count = Pick.count(:conditions => { :team_id => team.id })
        ps.avg = Pick.average(:points, :conditions => { :team_id => team.id })
        ps.max = Pick.maximum(:points, :conditions => { :team_id => team.id })
        ps.min = Pick.minimum(:points, :conditions => { :team_id => team.id })
        ps.total = Pick.sum(:points, :conditions => { :team_id => team.id })
        @pick_stats.push(ps)
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end