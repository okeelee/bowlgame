class Team < ActiveRecord::Base
  belongs_to :conference
  has_many :bowl_game_teams
  has_many :bowl_games, :through => :bowl_game_teams
  has_many :teams
  has_many :picks
  
  def self.update_from_espn_conference conference
    teams_data = EspnXmlReader.conference_teams(conference.espn_id)
    teams_data.each do |team_data|
      team = Team.find_by_espn_id(team_data[:teamId]) || Team.new
      team.update_attributes({
        :conference_id => conference.id,
        :name => team_data[:teamName],
        :short_name => team_data[:teamAbbrev],
        :nick_name => team_data[:teamNickname],
        :school_name => team_data[:teamLocation],
        :espn_id => team_data[:teamId],
        :rank => team_data[:rank],
        :division_win_percent => team_data[:divisionWinPercent],
        :home_win_percent => team_data[:homeWinPercent],
        :conference_win_percent => team_data[:conferenceWinPercent],
        :road_win_percent => team_data[:roadWinPercent],
        :win_percent => team_data[:winPercent],
        :avg_points_against => team_data[:avgPointsAgainst],
        :avg_points_for => team_data[:avgPointsFor],
        :clincher => team_data[:clincher],
        :division_losses => team_data[:divisionLosses],
        :division_ties => team_data[:divisionTies],
        :division_wins => team_data[:divisionWins],
        :games_behind => team_data[:gamesBehind],
        :games_played => team_data[:gamesPlayed],
        :home_losses => team_data[:homeLosses],
        :home_ties => team_data[:homeTies],
        :home_wins => team_data[:homeWins],
        :conference_losses => team_data[:conferenceLosses],
        :conference_ties => team_data[:conferenceTies],
        :conference_wins => team_data[:conferenceWins],
        :losses => team_data[:losses],
        :ot_losses => team_data[:OTLosses],
        :ot_ties => team_data[:OTTies],
        :ot_wins => team_data[:OTWins],
        :playoff_seed => team_data[:playoffSeed],
        :points => team_data[:points],
        :points_against => team_data[:pointsAgainst],
        :points_for => team_data[:pointsFor],
        :road_losses => team_data[:roadLosses],
        :road_ties => team_data[:roadTies],
        :road_wins => team_data[:roadWins],
        :streak => team_data[:streak],
        :ties => team_data[:ties],
        :wins => team_data[:wins]
      })
    end
  end
end