require 'test_helper'

class ConnectorizesControllerTest < ActionController::TestCase
  setup do
    @connectorize = connectorizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:connectorizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create connectorize" do
    assert_difference('Connectorize.count') do
      post :create, connectorize: { connectee1: @connectorize.connectee1, connectee1_accept: @connectorize.connectee1_accept, connectee1_email: @connectorize.connectee1_email, connectee2: @connectorize.connectee2, connectee2_accept: @connectorize.connectee2_accept, connector2_email: @connectorize.connector2_email, connector: @connectorize.connector, connector_email: @connectorize.connector_email, reason: @connectorize.reason }
    end

    assert_redirected_to connectorize_path(assigns(:connectorize))
  end

  test "should show connectorize" do
    get :show, id: @connectorize
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @connectorize
    assert_response :success
  end

  test "should update connectorize" do
    put :update, id: @connectorize, connectorize: { connectee1: @connectorize.connectee1, connectee1_accept: @connectorize.connectee1_accept, connectee1_email: @connectorize.connectee1_email, connectee2: @connectorize.connectee2, connectee2_accept: @connectorize.connectee2_accept, connector2_email: @connectorize.connector2_email, connector: @connectorize.connector, connector_email: @connectorize.connector_email, reason: @connectorize.reason }
    assert_redirected_to connectorize_path(assigns(:connectorize))
  end

  test "should destroy connectorize" do
    assert_difference('Connectorize.count', -1) do
      delete :destroy, id: @connectorize
    end

    assert_redirected_to connectorizes_path
  end
end
