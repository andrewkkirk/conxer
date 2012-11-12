require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	test "a user should have a name" do
		@user = User.new(:email => "info@yahoo.com")
		@user.save
		assert !@user.errors.get(:name).blank?, "name can not be blank"
	end
	
	test "a user should have an email" do
		@user = User.new(:name => "Steve")
		@user.save
		assert !@user.errors.get(:email).blank?, "email can not be blank"
	end

end
