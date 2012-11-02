class User < ActiveRecord::Base
  attr_accessible :email, :name
  
	has_many :connections
	
  validates_presence_of :name
  validates_presence_of :email
   						
end
