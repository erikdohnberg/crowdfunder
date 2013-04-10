class Pledge < ActiveRecord::Base
	belongs_to :projects
	belongs_to :user

	attr_accessible :description, :goal, :teaser, :title
end