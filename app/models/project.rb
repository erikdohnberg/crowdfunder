class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  has_many :images
  attr_accessible :description, :goal, :teaser, :title
end
