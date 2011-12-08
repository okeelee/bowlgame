class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :short_name
      t.integer :espn_id

      t.timestamps
    end
  end
end
