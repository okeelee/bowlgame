class HomeController < ApplicationController
  before_filter :get_user
  # GET /users
  # GET /users.json
  def index
    
    @posts = Post.includes(:user_comments).page(params[:page]).per(5)
    @games_today = BowlGame.includes([{:teams=>:conference}]).where(:game_time => Date.today+8.hours..Date.tomorrow+8.hours).order('game_time')
    @top5 = User.order('score DESC').limit(5)
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  private
  
  def get_user
    @user = User.where({:username=>params[:username]}).first
  end
end
