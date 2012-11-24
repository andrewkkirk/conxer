require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
	def setup
		@connection = Connection.new
		setup_associations
	end

	def setup_associations
		@connection.reason = 'reason'
		@connection.create_connectee1
		@connection.connectee1.email = 'john@doe.com'
		@connection.connectee1.name = 'John Doe'
		@connection.create_connectee2
		@connection.connectee2.email = 'jane@doe.com'
		@connection.connectee2.name = 'Jane Doe'
		@connection.create_connector
		@connection.connector.name = 'Andrew Kirk'
		@connection.connector.email = 'andrewkkirk@gmail.com'
	end

  test "when created, create a permission object as well" do
  	@connection.save!
  	assert @connection.permission.present?
	end
end