require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
	def setup
		@connection = FactoryGirl.create(:connection)
	end

	test "a valid connection object" do
		@connection
		assert @connection.valid?, "connection should be valid but isn't"
	end

	test "a reason can not be blank" do
		@connection.reason = nil
		assert !@connection.save
	end

	test "the reason cannot be longer than 160 characters" do
		@connection.reason = ("a" * 161)
		@connection.valid?
		assert @connection.errors[:reason].present?
	end

	# test "connectee1 is required" do
	# 	@connection.valid?
	# 	assert @connection.errors[:'connectee1.email'].present?
	# 	assert @connection.errors[:'connectee1.name'].present?
	# end

	test "connectee1 requires a name and email" do
		@connection.valid?
		assert @connection.errors[:'connectee1.email'].blank?
		assert @connection.errors[:'connectee1.name'].blank?
	end

	test "connectee2 requires a name and email" do
		@connection.valid?
		assert @connection.errors[:'connectee2.email'].blank?
		assert @connection.errors[:'connectee2.name'].blank?
	end

	test "connector requires a name and email" do
		@connection.valid?
		assert @connection.errors[:'connector.email'].blank?
		assert @connection.errors[:'connector.name'].blank?
	end

	test "a valid connection object saves successfully" do
		@connection.save!
		id = @connection.id
		assert Connection.exists?(id)
	end

	test "associations not nil" do
		@connection
		assert_not_nil @connection.connectee1
		assert_not_nil @connection.connectee2
		assert_not_nil @connection.connector
	end
end
