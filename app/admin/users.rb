ActiveAdmin.register User do
  index do
    column :email
    column :username
    column :admin
    default_actions
  end
  
  show :title => :username do
    h3 user.username
    attributes_table :username, :email, :admin
  end
  
  form do |f|
    f.inputs "User Information" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
end
