require 'test_helper'

class ConnectionsControllerTest < ActionController::TestCase

  def setup
    @connection = FactoryGirl.create(:connection)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:connection)
  end

  test "should create connection" do
    assert_difference('Connection.count') do
      post :create,
      			connection: {
      				reason: "a reason",
      				connector_attributes: {
      					name: "name",
      					email: "steve@andrewkkirk.com",
                password: "password",
                password_confirmation: "password"
      				},
      				connectee1_attributes: {
      					name: "name",
      					email: "andrew347893749@yahoo.com",
                password: "password",
                password_confirmation: "password"
      				},
							connectee2_attributes: {
      					name: "name",
      					email: "jery3593@gmail.com",
      				  password: "password",
                password_confirmation: "password"
              }
      }
    end

    assert_not_nil assigns(:connection)
    assert_not_nil assigns(:connection).connectee1
    assert_not_nil assigns(:connection).connectee2
    assert_not_nil assigns(:connection).connector
    assert_not_nil assigns(:connection).reason

    assert_redirected_to connection_path(assigns(:connection))
  end

  # test "should get connection list" do
  #   get :connection
  #   user_signed_in?
  #     :
  # end

end