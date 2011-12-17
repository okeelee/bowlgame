ActiveAdmin.register Post do
  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :author, :collection => User.order('first_name'), :label_method => Proc.new { |user| "#{user.first_name} #{user.last_name} - #{user.username}" } 
    end
    f.buttons
  end
end