class ConnectionMailer < ActionMailer::Base
  default from: "andrew@andrewkkirk.com"

	def connectee1_email(connectee1, connectee2, connector, reason)
		@connectee1 = connectee1
		@connectee2 = connectee2
		@connector = connector
		@reason = reason
		mail(:to => connectee1.email, :subject => "#{connectee1.name}, #{connector.name} wants to make an introduction.")
	end

	def connectee2_email(connectee1, connectee2, connector, reason)
		@connectee1 = connectee1
		@connectee2 = connectee2
		@connector = connector
		@reason = reason
		mail(:to => connectee2.email, :subject => "#{connectee2.name}, #{connector.name} wants to make an introduction.")
	end
end
