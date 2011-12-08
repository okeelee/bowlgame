class BowlGameTeam < ActiveRecord::Base
  belongs_to :bowl_game
  belongs_to :team
end
