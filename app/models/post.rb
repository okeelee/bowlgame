class Post < ActiveRecord::Base
  has_many :user_comments, :as => :commentable
  belongs_to :author, :class_name => "User"
  validates_presence_of :author
  validates_presence_of :title
  validates_presence_of :body
end
