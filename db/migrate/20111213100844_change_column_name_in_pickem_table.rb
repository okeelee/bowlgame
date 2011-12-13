class ChangeColumnNameInPickemTable < ActiveRecord::Migration
  def up
    rename_column :pickems, :start_name, :start_time
  end

  def down
    rename_column :pickems, :start_time, :start_name
  end
end
