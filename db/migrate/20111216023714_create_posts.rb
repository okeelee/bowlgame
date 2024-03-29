class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.boolean :disallow_comments
      t.integer :author_id

      t.timestamps
    end
  end
end
