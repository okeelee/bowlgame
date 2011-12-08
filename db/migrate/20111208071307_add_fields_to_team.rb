class AddFieldsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :rank, :integer
    add_column :teams, :division_win_percent, :float
    add_column :teams, :home_win_percent, :float
    add_column :teams, :conference_win_percent, :float
    add_column :teams, :road_win_percent, :float
    add_column :teams, :win_percent, :float
    add_column :teams, :avg_points_against, :float
    add_column :teams, :avg_points_for, :float
    add_column :teams, :clincher, :integer
    add_column :teams, :division_losses, :integer
    add_column :teams, :division_ties, :integer
    add_column :teams, :division_wins, :integer
    add_column :teams, :games_behind, :float
    add_column :teams, :games_played, :integer
    add_column :teams, :home_losses, :integer
    add_column :teams, :home_ties, :integer
    add_column :teams, :home_wins, :integer
    add_column :teams, :conference_losses, :integer
    add_column :teams, :conference_ties, :integer
    add_column :teams, :conference_wins, :integer
    add_column :teams, :losses, :integer
    add_column :teams, :ot_losses, :integer
    add_column :teams, :ot_ties, :integer
    add_column :teams, :ot_wins, :integer
    add_column :teams, :playoff_seed, :integer
    add_column :teams, :points, :float
    add_column :teams, :points_against, :integer
    add_column :teams, :points_for, :integer
    add_column :teams, :road_losses, :integer
    add_column :teams, :road_ties, :integer
    add_column :teams, :road_wins, :integer
    add_column :teams, :streak, :integer
    add_column :teams, :ties, :integer
    add_column :teams, :wins, :integer
  end
end
