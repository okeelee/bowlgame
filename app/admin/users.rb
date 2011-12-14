ActiveAdmin.register User do
  index do
    column :email
    column :username
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
  
end
