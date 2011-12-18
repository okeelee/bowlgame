ActiveAdmin.register User do
  index do
    column :email
    column :username
    column :first_name
    column :last_name
    column :admin
    column :paid
    column "Set Paid / Gen Picks" do |user|
      link_to "generate", generate_picks_admin_user_path(user.id)
    end
    column "Remove Picks" do |user|
      link_to "remove", destroy_all_picks_admin_user_path(user.id)
    end
    default_actions
  end
  
  show :title => :username do
    h3 user.username
    attributes_table :username, :first_name, :last_name, :email, :admin, :paid
  end
  
  form do |f|
    f.inputs "User Information" do
      f.input :username
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :admin
      f.input :paid
    end
    f.buttons
  end
  
  member_action :generate_picks do
    user = User.find(params[:id])
    user.paid = true
    user.save
    
    Pick.generate_for_user user
    
    redirect_to(:back)
  end
  
  member_action :destroy_all_picks do
    user = User.find(params[:id])
    user.picks.destroy_all
    
    redirect_to(:back)
  end
  
  action_item :only => :index do 
    link_to('Update Standings', update_standings_admin_users_path) 
  end
  
  collection_action :update_standings, :method => :get do
    User.update_standings
    redirect_to :action => :index, :notice => "Standings updated!"
  end
  
end
