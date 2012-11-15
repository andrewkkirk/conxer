require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
	test "a reason can not be blank" do
		@connection = Connection.new 
		@connection.save
		assert !@connection.errors.get(:reason).blank?, "reason can not be blank" 
	end

	test "connection accepts attributes for connector" do
		
	end

end
