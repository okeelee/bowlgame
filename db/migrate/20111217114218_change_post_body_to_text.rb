class ChangePostBodyToTest < ActiveRecord::Migration
  def up
    change_column :posts, :body, :text
  end

  def down
    change_column :posts, :body, :string
  end
end
