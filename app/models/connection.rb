class Connection < ActiveRecord::Base
	attr_accessible :reason, :established, :connector, :connectee1, :connectee2,
									:notify_connector_of_success, :connectee1_attributes, :connectee2_attributes,
									:connector_attributes

	belongs_to :connector, class_name: "User"
	belongs_to :connectee1, class_name: "User"
	belongs_to :connectee2, class_name: "User"

	accepts_nested_attributes_for :connector, :connectee1, :connectee2

	after_initialize :build_associated_parties

	validates :reason, :presence => true
	validates_length_of :reason, :maximum => 250

	after_create :setup_and_send_emails

  def setup_and_send_emails
  	mail_introduce_connectees
  	log_successful_mail
  end

	#builds connectee's, connector, permission objects
	def build_associated_parties
		build_connector unless connector
		build_connectee1 unless connectee1
		build_connectee2 unless connectee2
	end

	# Sends email to both connectee1 and connectee2 with offer to connect #
	def mail_introduce_connectees
		ConnectionMailer.connectee1_email(self).deliver
		# ConnectionMailer.connectee2_email(self).deliver
	end

	def log_successful_mail
		Rails.logger.info "Mailed successfully!"
	end

	# action for connectee to accept connection invitaiton
	def accept(connectee_id)
		if connectee_id == self.connectee1_id.to_s
			self.connectee1_accepted = true
		elsif connectee_id == self.connectee2_id.to_s
			self.connectee2_accepted = true
		end
		self.save
		if established?
			ConnectionMailer.connection_established_email(self).deliver
			notify_connector
		end
	end

# action for connectee to deny connection invitation
	def deny(connectee_id)
		if connectee_id == self.connectee1_id.to_s
			self.connectee1_accepted = false
		elsif connectee_id == self.connectee2_id.to_s
			self.connectee2_accepted = false
		end
		self.save
	end

	def established?
		connectee1_accepted && connectee2_accepted
	end

# if all connectees accept and connector chooses to be notified, email sent to connector.
	def notify_connector
		ConnectionMailer.notify_connector(self).deliver if self.notify_connector_of_success
	end

end
