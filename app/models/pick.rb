class Pick < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :bowl_game
  belongs_to :pickem
  
  validates_uniqueness_of :bowl_game_id, :scope => :user_id
  
  def self.generate_for_user user
    pickem = Pickem.find PICKEM_ID
    bowl_games = BowlGame.where({:pickem_id=>pickem.id})
    
    bowl_games.each do |bowl_game|
      Pick.create({:user_id=>user.id, :bowl_game_id=>bowl_game.id, :pickem_id=>pickem.id})
    end
  end
end
