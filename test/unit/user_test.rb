require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a name" do
		user = User.new
		assert !user.save
	end
end
