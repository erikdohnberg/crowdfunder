class My::ProjectsController < ApplicationController
  def index
  	@projects = current_user.projects.all
  	
  end

  def new
  end

  def edit
  	@projects = 
  end
end
