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
  
	end