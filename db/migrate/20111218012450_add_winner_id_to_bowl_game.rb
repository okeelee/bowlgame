class AddWinnerIdToBowlGame < ActiveRecord::Migration
  def change
    add_column :bowl_games, :winner_id, :integer
  end
end
