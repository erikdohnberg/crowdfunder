require 'test_helper'

class My::PledgeFlowsTest < ActionDispatch::IntegrationTest

	test "there is a my projects link in the nav bar" do
		get_signed_in_user
		visit '/'
		assert find('.navbar').has_link?('My Projects')		
	end

end