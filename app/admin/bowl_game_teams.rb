ActiveAdmin.register BowlGameTeam do
  
  index do
    column :bowl_game
    column :team do |bg_team|
      link_to "#{bg_team.team.school_name} #{bg_team.team.name}", admin_team_path(bg_team.team)
    end
    default_actions
  end
  
  form do |f|
    f.inputs do
      f.input :bowl_game
      f.input :team, :collection => Team.order('school_name'), :label_method => Proc.new { |team| "#{team.school_name} #{team.name}" } 
    end
    f.buttons
  end
  
end
