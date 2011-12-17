class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :paid, :admin, :first_name, :last_name
  
  has_many :picks
  has_many :posts
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :username, :without => /\W/, :message => "can only have letters, numbers, and underscores"
  
  def is_admin?
    self.admin?
  end
  
  def has_paid?
    self.paid?
  end
end
