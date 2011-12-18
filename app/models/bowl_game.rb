class BowlGame < ActiveRecord::Base
  has_many :bowl_game_teams
  has_many :teams, :through => :bowl_game_teams
  belongs_to :pickem
  has_many :picks
  belongs_to :winner, :class_name => "Team"
end
