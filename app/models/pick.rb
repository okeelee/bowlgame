class Pick < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :bowl_game
end
