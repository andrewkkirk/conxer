class Connection < ActiveRecord::Base 

	belongs_to :connector, :class_name => "User" 
	belongs_to :connectee1, :class_name => "User"
	belongs_to :connectee2, :class_name => "User"

	accepts_nested_attributes_for :connectee1, :connectee2 
	
end
