class Connection < ActiveRecord::Base 
	attr_accessible :reason, :established, :connector, :connectee1, :connectee2, 
									:connectee1_attributes, :connectee2_attributes, :connector_attributes 
	
	belongs_to :connector, class_name: "User" 
	belongs_to :connectee1, class_name: "User"
	belongs_to :connectee2, class_name: "User"

	accepts_nested_attributes_for :connector, :connectee1, :connectee2 
	
	validates :reason, :presence => true

	after_create :mail_connectees
	
	def mail_connectees
		ConnectionMailer.connectee1_email(connectee1).deliver
		ConnectionMailer.connectee2_email(connectee2).deliver
	end
end
