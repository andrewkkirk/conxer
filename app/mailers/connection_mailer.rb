class ConnectionMailer < ActionMailer::Base
  default from: "andrew@andrewkkirk.com"

	def connectee1_email(connectee1)
		mail(:to => connectee1.email, :subject => "You have a new connection waiting")
	end

	def connectee2_email(connectee2)
		email_with_name = "#{connectee2.name} <#{connectee2.email}>"
		mail(:to => connectee2.email, :subject => "You have a new connection waiting")
	end

end
