ActiveAdmin.register Conference do
  
  index do
    column :name
    column :short_name
    column :teams do |conference|
      link_to "view teams (#{conference.teams.size})", admin_teams_path({:q=>{:conference_id_eq=>conference.id}})
    end
    column "ESPN Import" do |conference|
      link_to "import", import_conference_teams_admin_conference_path(conference.id)
    end
    default_actions
  end
  
  show do
    attributes_table :name, :short_name, :teams
  end
  
  action_item :only => :index do 
    link_to('Import From ESPN', import_conferences_admin_conferences_path) 
  end
  
  action_item :only => :show do 
    link_to('Import Teams From ESPN', import_conference_teams_admin_conference_path(params[:id])) 
  end
  
  collection_action :import_conferences, :method => :get do
    Conference.update_from_espn
    redirect_to :action => :index, :notice => "Conferences updated!"
  end
  
  member_action :import_conference_teams do
    Team.update_from_espn_conference Conference.find(params[:id])
    redirect_to(:back)
  end
  
end
