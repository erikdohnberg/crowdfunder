class Pledge < ActiveRecord::Base
	
  attr_accessible :amount

  belongs_to :user
  belongs_to :project

  after_create :send_new_pledge_email

  validates :amount,  :numericality => {:only_integer => true, :greater_than => 0}, :presence => true
  validates :user, :presence => true
  validates :project, :presence => true

  def send_new_pledge_email
  	UserMailer.new_pledge(self).deliver
  end

end
