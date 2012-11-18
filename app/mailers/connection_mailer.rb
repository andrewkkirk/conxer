class ConnectionMailer < ActionMailer::Base
  default from: "andrew@andrewkkirk.com"

	def connectee1_email(connectee1)
		mail(:to => connectee1.email, :subject => "#{connectee1.name}, con wants to introduce you to connectee2")
	end

	def connectee2_email(connectee2)
		mail(:to => connectee2.email, :subject => "You have a new connection waiting")
	end

end
