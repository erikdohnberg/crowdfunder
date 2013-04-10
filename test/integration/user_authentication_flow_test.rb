require 'test_helper'

class UserAuthenticationFlowTest < ActionDispatch::IntegrationTest

	test "successful registration" do 
  	visit "/users/new"
  	assert_equal new_user_path, current_path

  	# The signup button should be visible unless already signed in
  	assert find('.navbar').has_link?('Sign Up')

  	user = FactoryGirl.build(:user) 

  	fill_in "user[email]", :with => user.email
  	fill_in "user[first_name]", :with => user.first_name
  	fill_in "user[last_name]", :with => user.last_name
  	fill_in "user[password]", :with => user.password
  	click_button "Create Account"

  	assert_equal root_path, current_path
  	assert page.has_content?("Account created")

  	# No sign up button, logout button instead
  	assert find('.navbar').has_no_link?('Sign Up')
  	assert find('.navbar').has_link?('Logout')
  end

  test "failed registration" do 
  	visit "/users/new"
		user = FactoryGirl.build(:user) 

		fill_in "user[email]", :with => user.email
		click_button "Create Account"
		assert_equal users_path, current_path
		assert page.has_no_content?("Account created")

    # Should see some sort of error message on failure to register 
    assert find('.alert:first').has_content?("Try again")
  end

  test "logout" do
    # Login as user so we can do test (setup)
    Capybara.current_driver = Capybara.javascript_driver
    ser = get_signed_in_user

    # Actual test
    visit '/projects'
    click_button 'Logout'
    assert_equal root_path, current_path

  end

  test "successful log in" do 
    get_signed_in_user
    assert_equal root_path, current_path
    assert find('.navbar').has_link?('Logout')
  end

  test "unsuccessful log in" do
    # Figure this one out yourself
  end

end