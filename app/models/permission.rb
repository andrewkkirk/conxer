class Permission < ActiveRecord::Base
  attr_accessible :connectee1_response, :connectee2_response

  has_one :connection
  
end
