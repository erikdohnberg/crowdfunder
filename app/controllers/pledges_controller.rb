class PledgesController < ApplicationController
  
  before_filter :require_login
  before_filter :require_project

  def new
  	@pledge = @project.pledges.build
  end

  def create
  end
end
