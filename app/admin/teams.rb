ActiveAdmin.register Team do
  filter :conference
  filter :name
  
  index do
    column :school_name
    column :name
    column :conference
    column :wins
    column :losses
    column :espn_id
    default_actions
  end
  
end
