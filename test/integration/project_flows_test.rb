require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest

  test "the index page lists all out projects" do
  	# Create a bunch of projects (3) in the DG (using FG)
  	p1 = FactoryGirl.create(:project)
  	p2 = FactoryGirl.create(:project, title: "Waterproof Whiteboard")
  	p3 = FactoryGirl.create(:project, title: "Something else??")

  	visit '/projects'
  	assert page.has_content?('Listing Projects')

  	# assert that the page has projects listed
  	assert page.has_content?('Wifi-enabled Shoes')
  	assert page.has_content?('Waterproof Whiteboard')
  	assert page.has_content?('Something else??')
  end

end
