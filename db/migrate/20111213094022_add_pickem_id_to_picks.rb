class AddPickemIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :pickem_id, :integer
  end
end
