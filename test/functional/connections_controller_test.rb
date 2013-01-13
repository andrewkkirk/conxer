require 'test_helper'

class ConnectionsControllerTest < ActionController::TestCase

  def setup
    @connection = FactoryGirl.create(:connection)
  end

  def create_new_connection
    post :create,
            connection: {
              reason: "a reason",
              connector_attributes: {
                name: "name",
                email: "steve@andrewkkirk.com",
              },
              connectee1_attributes: {
                name: "name",
                email: "andrew347893749@yahoo.com",
              },
              connectee2_attributes: {
                name: "name",
                email: "jery3593@gmail.com",
              }
      }
    end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:connection)
  end

  test "should create connection" do
    assert_difference('Connection.count') do
      create_new_connection
    end

    assert_not_nil assigns(:connection)
    assert_not_nil assigns(:connection).connectee1
    assert_not_nil assigns(:connection).connectee2
    assert_not_nil assigns(:connection).connector
    assert_not_nil assigns(:connection).reason

    assert_redirected_to connection_path(assigns(:connection))
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:connections)
  # end

  # test "index shows only connections belonging to connector" do
  #   get :index
  #   login_user
  #   assigns(:connections).each do |connection|
  #       assert_equal connection.connector, @user
  #   end
  # end

  # test "is user is signed in, then connector automatically set to user" do
  #   login_user
  #   create_new_connection
  #   assert_equal assigns(:connection).connector.name, @user.name
  #   assert_equal assigns(:connection).connector.email, @user.email
  # end
end