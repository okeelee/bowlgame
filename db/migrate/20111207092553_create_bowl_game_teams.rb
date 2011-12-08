class CreateBowlGameTeams < ActiveRecord::Migration
  def change
    create_table :bowl_game_teams do |t|
      t.integer :bowl_game_id
      t.integer :team_id

      t.timestamps
    end
  end
end
