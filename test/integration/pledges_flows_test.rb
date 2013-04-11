require 'test_helper'

class PledgesControllerTest < ActionController::TestCase

	setup do
		@project = FactoryGirl.create :project
	end

	test "pledge now links" do
		visit '/project#show'
	end
	
end