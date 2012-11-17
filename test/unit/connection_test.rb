require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
	def setup
		@connection = Connection.new 
	end

	def setup_associations
		@connection.connectee1.email = 'john@doe.com'
		@connection.connectee1.name = 'John Doe'
		@connection.connectee2.email = 'jane@doe.com'
		@connection.connectee2.name = 'Jane Doe'
		@connection.connector.name = 'Andrew Kirk'
		@connection.connector.email = 'andrewkkirk@gmail.com'
	end

	def make_connection
		conn = Connection.new
		conn.reason = "hey"
		conn.connectee1.email = 'john@doe.com'
		conn.connectee1.name = 'John Doe'
		conn.connectee2.email = 'jane@doe.com'
		conn.connectee2.name = 'Jane Doe'
		conn.connector.name = 'Andrew Kirk'
		conn.connector.email = 'andrewkkirk@gmail.com'
		conn
	end

	test "a reason can not be blank" do
		connection = make_connection
		connection.reason = nil
		@connection.valid?
		assert !@connection.errors.get(:reason).blank?, "reason can not be blank"
		assert_equal ["can't be blank"], @connection.errors[:reason]
	end

	test "the reason cannot be longer than 160 characters" do
		@connection.reason = ("a" * 161)
		@connection.valid?
		assert @connection.errors[:reason].present?
	end

	test "a valid Connection object" do
		@connection.reason = "hey"
		setup_associations
		assert @connection.valid?, "connection should be valid but isn't"
	end

	# test "connectee1 is required" do
	# 	@connection.valid?
	# 	assert @connection.errors[:'connectee1.email'].present?
	# 	assert @connection.errors[:'connectee1.name'].present?
	# end

	test "connectee1 requires a name and email" do
		@connection.connectee1.email = "john@doe.com"
		@connection.connectee1.name = "John Doe"
		@connection.valid?
		assert @connection.errors[:'connectee1.email'].blank?
		assert @connection.errors[:'connectee1.name'].blank?
	end

	test "connectee2 requires a name and email" do
		@connection.connectee2.email = "john@doe.com"
		@connection.connectee2.name = "John Doe"
		@connection.valid?
		assert @connection.errors[:'connectee2.email'].blank?
		assert @connection.errors[:'connectee2.name'].blank?
	end

	test "connector requires a name and email" do
		@connection.connector.email = "john@doe.com"
		@connection.connector.name = "John Doe"
		@connection.valid?
		assert @connection.errors[:'connector.email'].blank?
		assert @connection.errors[:'connector.name'].blank?
	end

	test "a valid Connection object saves successfully" do
		@connection.reason = "hey"
		setup_associations
		@connection.save!
		id = @connection.id
		assert Connection.exists?(id)
	end
end
