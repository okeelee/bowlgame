class CreatePickems < ActiveRecord::Migration
  def change
    create_table :pickems do |t|
      t.string :name
      t.timestamp :start_name
      t.timestamp :end_time

      t.timestamps
    end
  end
end
