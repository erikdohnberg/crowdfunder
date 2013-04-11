require 'test_helper'

class My::ProjectFlowsTest < ActionDispatch::IntegrationTest

  test "there is a my projects link in the nav bar" do
    get_signed_in_user
    visit "/"

    assert find('.navbar').has_link?('My Projects')
  end

  test "the my projects link is not there when I log out" do
    visit "/"
    assert_false find('.navbar').has_link?('My Projects')
  end

  test "the my projects link is active when I visit the my projects page" do
    get_signed_in_user
    visit my_projects_url
    assert_equal find("ul.nav li.active a").text, "My Projects"
  end

  test "the my projects page lists all of my projects" do
    user = get_signed_in_user
    5.times { FactoryGirl.create(:project, :user => user)}
    other_user = FactoryGirl.create(:user)
    FactoryGirl.create(:project, :user => other_user, :title => "Not my project")

    visit my_projects_url

    user.projects.each do |project|
      assert page.has_content?(project.title)
    end
    
    assert page.has_no_content?("Not my project")

  end

  test "my projects page has a new project button" do
  	get_signed_in_user
  	visit my_projects_url
  	assert page.has_link?('Add New Project')
  end

  test "the new project button directs to the correct page" do
  	get_signed_in_user
  	visit my_projects_url
  	click_link("Add New Project")
  	assert_equal new_my_project_path, current_path
  end

  test "a filled form submits to the database" do
  	get_completed_form
  	click_button 'Create Project'
  	
  end

  test "all fields are filled out before submitting form" do

  end
end