class My::ProjectsController < ApplicationController
  def index
  	@projects = current_user.projects.all

  end

  def new
  	@project = Project.new
  end

  def edit
  	@project = Project.find params[:id]
  end
end
