class PickStatsController < ApplicationController
  def index
    @bowl_games = BowlGame.includes([:teams]).order('game_time');
    
    @pick_stats = []
    @bowl_games.each do |bowl_game|
      
      @pick_stats << PickStat.new(bowl_game)
      
    end
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end