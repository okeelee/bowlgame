class HomeController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @posts = Post.includes(:user_comments).order('created_at DESC').limit(5)    
    @games_today = BowlGame.includes([{:teams=>:conference}, {:picks=>:team}]).where(:game_time=>Date.today..Date.today.tomorrow).where(:picks=>{:user_id=>current_user.id}).order('game_time')
    @top5 = User.order('score DESC').limit(5)
  end
end
