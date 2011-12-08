class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :short_name
      t.string :nick_name
      t.string :school_name
      t.integer :conference_id
      t.integer :espn_id

      t.timestamps
    end
  end
end
