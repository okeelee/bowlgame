class PickStat
  attr_accessor :bowl_game, :teams
  
  def initialize(bowl_game)
    @bowl_game = bowl_game
    @teams = []
    self.add_teams(bowl_game.teams)
  end
  
  def add_teams(teams)
    teams.each do |team|
      @teams << {
        :team => team,
        :stats => {
          :count => Pick.count(:conditions => { :team_id => team.id }),
          :avg => Pick.average(:points, :conditions => { :team_id => team.id }),
          :max => Pick.maximum(:points, :conditions => { :team_id => team.id }),
          :min => Pick.minimum(:points, :conditions => { :team_id => team.id }),
          :total => Pick.sum(:points, :conditions => { :team_id => team.id })
        }
      }
    end
  end
end