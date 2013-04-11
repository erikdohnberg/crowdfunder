require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  test "the pledge requires an amount, a user and a project"  do
  	pledge = Pledge.new
  	assert_false pledge.save
  end
  
end
