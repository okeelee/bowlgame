class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :paid, :admin, :first_name, :last_name, :score
  
  # only pull the picks from this round and order them by points
  has_many :picks, :order => 'picks.points DESC', :conditions => {:pickem_id => PICKEM_ID}
  has_many :posts
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_format_of :username, :without => /\W/, :message => "can only have letters, numbers, and underscores"
  
  def self.update_standings
    users = User.where(:paid=>true)
    bowls = BowlGame.where("winner_id IS NOT NULL")
    bowl_ids = bowls.collect{|b| b.id}
    winner_ids = bowls.collect{|b| b.winner_id}
    users.each do |user|
      user.score = 0
      user.picks.where({:bowl_game_id=>[bowl_ids]}).each do |pick|
        if pick.team_id.present? && pick.team_id!=0 && pick.points.present?
          if winner_ids.include?(pick.team_id)
            user.score += pick.points
          else
            user.score -= pick.points
          end
        else
          user.score -= 35
        end
      end
      user.save
    end
    
  end
  
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
