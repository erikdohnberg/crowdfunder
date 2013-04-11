class Pledge < ActiveRecord::Base
	
  attr_accessible :amount

  validates :amout, :presence => true
  validates :user_id, :presence => true
  validates :project_id, :presence => true
end
