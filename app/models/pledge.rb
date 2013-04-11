class Pledge < ActiveRecord::Base
	
  attr_accessible :amount

  belongs_to :user
  belongs_to :project

  validates :amount,  :numericality => {:only_integer => true, :greater_than => 0}, :presence => true
  validates :user, :presence => true
  validates :project, :presence => true
end
