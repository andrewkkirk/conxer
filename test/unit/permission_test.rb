require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  
  test "connectee1_response is not nil" do
	  @permission = Permission.new
	  assert (:connectee1_response == true || false) 
	end

end
