class Post < ActiveRecord::Base
  has_many :user_comments, :as => :commentable
end
