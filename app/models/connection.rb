class Connection < ActiveRecord::Base 
	attr_accessible :reason, :established, :connector, :connectee1, :connectee2, 
									:connectee1_attributes, :connectee2_attributes, :connector_attributes 
	
	belongs_to :connector, class_name: "User" 
	belongs_to :connectee1, class_name: "User"
	belongs_to :connectee2, class_name: "User"

	accepts_nested_attributes_for :connector, :connectee1, :connectee2 

	belongs_to :permission 
	
	validates :reason, :presence => true
	validates_length_of :reason, :maximum => 160

	# after_initialize :build_associated_parties	
	
  after_create :setup_and_send_emails

  def setup_and_send_emails
  	p = Permission.create
  	self.permission = p
    self.save!
  	#create_permission
  	mail_introduce_connectees
  	log_successful_mail
  end

	# Builds connectee's and connector objects
	# def build_associated_parties
	# 	build_connector
	# 	build_connectee1
	# 	build_connectee2
	# end

	# Sends email to both connectee1 and connectee2 with offer to connect #
	def mail_introduce_connectees
		ConnectionMailer.connectee1_email(self).deliver
		ConnectionMailer.connectee2_email(connectee1, connectee2, connector, reason).deliver
	end

	def log_successful_mail
		Rails.logger.info "Mailed successfully!"
	end

	# after save of connections, create a new permission instance
	# after_create permission.new 
	
end
