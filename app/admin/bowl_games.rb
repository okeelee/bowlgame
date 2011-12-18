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
  
  form do |f|
    f.inputs do
      f.input :pickem
      f.input :name
      f.input :city
      f.input :state
      f.input :game_time
      f.input :network
      f.input :winner, :collection => Team.order('school_name'), :label_method => Proc.new { |team| "#{team.school_name} #{team.name}" } 
    end
    f.buttons
  end
  
end
