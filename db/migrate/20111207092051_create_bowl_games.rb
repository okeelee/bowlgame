class CreateBowlGames < ActiveRecord::Migration
  def change
    create_table :bowl_games do |t|
      t.string :name
      t.string :city
      t.string :state
      t.timestamp :game_time
      t.string :network
      t.integer :pickem_id

      t.timestamps
    end
  end
end
