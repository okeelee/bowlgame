class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :paid, :admin, :first_name, :last_name
  
  # only pull the picks from this round and order them by points
  has_many :picks, :order => 'picks.points DESC', :conditions => {:pickem_id => PICKEM_ID}
  has_many :posts
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :username, :without => /\W/, :message => "can only have letters, numbers, and underscores"
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def is_admin?
    self.admin?
  end
  
  def has_paid?
    self.paid?
  end
end
