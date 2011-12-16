class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :user_comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.timestamps
    end

    add_index :user_comments, :commentable_type
    add_index :user_comments, :commentable_id
    add_index :user_comments, :user_id
  end

  def self.down
    drop_table :user_comments
  end
end
