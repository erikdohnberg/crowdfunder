class UserMailer < ActionMailer::Base
  default from: "no-reply@crowdfunder.com"

  def new_pledge(pledge)
  	@owner = pledge.project.user
  	@project = pledge.project
  	@pledge = pledge
  	@backer = pledge.user

  	mail(:to => owner.email, :subject => "New pledge for your project!")
  end

  # def forgot_password(user)
  # end
end
