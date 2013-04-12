class My::ProjectsController < ApplicationController
  before_filter :require_login
  before_filter :require_project, except: [:index, :new, :create]

  def index
  	@projects = current_user.projects.all
  end

  def new
  	@project = current_user.projects.new
  end

  def edit
  	@project = Project.find params[:id]
  end

  def create
  	@project = current_user.projects.build params[:project]
  	if @project.save
  		redirect_to [:my, :projects], notice: "Project created!"
  	else
  		render :new
  	end
  end

   def destroy
    @project.destroy
    redirect_to [:my, :projects], notice: "Project deleted"
  end

  protected

  def require_project
    @project = current_user.projects.find params[:id]
  end

  def nav_state
    @nav = :my_projects
  end
end
