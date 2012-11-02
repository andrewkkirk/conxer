require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should have a name" do
		user = User.new
		assert !user.save
	end
	
	test "a user should have an email" do
		user = User.new
		assert !user.save
	end
end
