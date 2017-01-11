class HomeController < ApplicationController
  def index
  	@users = User.all
  	@notes = current_user.notes.all
  end
end
