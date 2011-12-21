class BowlGamesController < ApplicationController
  def index
    startDate = Date.parse("2011-12-17")
    @dateRanges = { "1" => (startDate+8.hour)..(startDate+1.week+8.hour), "2" => (startDate+1.week+8.hour)..(startDate+2.week+8.hour), "3" => (startDate+2.week+8.hour)..(startDate+3.week+8.hour), "4" => (startDate+3.week+8.hour)..(startDate+4.week+8.hour)}
    
    @bowl_games_hash = {}
    @dateRanges.each do |key, value|
      temp_bowl_games = BowlGame.includes([{:teams=>:conference},{:picks=>:team}]).where({:game_time=>value}).where(:picks=>{:user_id=>current_user.id}).order('game_time')
      if !temp_bowl_games.nil?
        @bowl_games_hash[key] = temp_bowl_games
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
