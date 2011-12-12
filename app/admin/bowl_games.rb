ActiveAdmin.register BowlGame do
  index do
    column :pickem
    column :name
    column :city
    column :state
    column :game_time
    column :network
    default_actions
  end
end
