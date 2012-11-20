class Connection < ActiveRecord::Base 
	attr_accessible :reason, :established, :connector, :connectee1, :connectee2, 
									:connectee1_attributes, :connectee2_attributes, :connector_attributes 
	
	belongs_to :connector, class_name: "User" 
	belongs_to :connectee1, class_name: "User"
	belongs_to :connectee2, class_name: "User"

	accepts_nested_attributes_for :connector, :connectee1, :connectee2 
	
	validates :reason, :presence => true
	validates_length_of :reason, :maximum => 160

	# after_initialize :build_associated_parties	
	after_create :mail_introduce_connectees
	after_create :log_successful_mail
	
	# Builds connectee's and connector objects
	# def build_associated_parties
	# 	build_connector
	# 	build_connectee1
	# 	build_connectee2
	# end

	# Sends email to both connectee1 and connectee2 with offer to connect #
	def mail_introduce_connectees
		ConnectionMailer.connectee1_email(connectee1, connectee2, connector, reason).deliver
		ConnectionMailer.connectee2_email(connectee1, connectee2, connector, reason).deliver
	end

	def log_successful_mail
		Rails.logger.info "Mailed successfully!"
	end

	
end
