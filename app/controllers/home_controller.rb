class HomeController < ApplicationController
  # GET /users
  # GET /users.json
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
