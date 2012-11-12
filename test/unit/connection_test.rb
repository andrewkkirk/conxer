require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
	test "a reason can not be blank" do
		@connection = Connection.new 
		assert !@connection.errors.get(:reason).blank?, "reason can not be blank" 
	end

end
