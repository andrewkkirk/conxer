require 'test_helper'

class ConnectionsControllerTest < ActionController::TestCase

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
      					email: "steve@andrewkkirk.com"
      				},
      				connectee1_attributes: { 
      					name: "name",
      					email: "andrew347893749@yahoo.com"
      				},
							connectee2_attributes: { 
      					name: "name",
      					email: "jery3593@gmail.com"
      				}					
      }			
    end
    
    assert_not_nil assigns(:connection)
    assert_not_nil assigns(:connection).connectee1
    assert_not_nil assigns(:connection).connectee2

    assert_redirected_to connection_path(assigns(:connection))
  end

#  test "should show connectorize" do
#    get :show, id: @connectorize
#    assert_response :success
#  end
# end
#   test "should get edit" do
#     get :edit, id: @connectorize
#     assert_response :success
#   end
# 
#   test "should update connectorize" do
#     put :update, id: @connectorize, connectorize: { connectee1: @connectorize.connectee1, connectee1_accept: @connectorize.connectee1_accept, connectee1_email: @connectorize.connectee1_email, connectee2: @connectorize.connectee2, connectee2_accept: @connectorize.connectee2_accept, connector2_email: @connectorize.connector2_email, connector: @connectorize.connector, connector_email: @connectorize.connector_email, reason: @connectorize.reason }
#     assert_redirected_to connectorize_path(assigns(:connectorize))
#   end
# 
#   test "should destroy connectorize" do
#     assert_difference('Connectorize.count', -1) do
#       delete :destroy, id: @connectorize
#     end
# 
#     assert_redirected_to connectorizes_path
#   end
	end