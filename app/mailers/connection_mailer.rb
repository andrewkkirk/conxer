class ConnectionMailer < ActionMailer::Base
  default from: "andrew@andrewkkirk.com"

	def connectee1_email(connection)
		@connection = connection
		@connectee1 = connection.connectee1
		@connectee2 = connection.connectee2
		@connector = connection.connector
		@reason = connection.reason
		mail(:to => @connectee1.email,
					:subject => "#{@connectee1.name}, #{@connector.name} wants to make an introduction.")
	end

	def connectee2_email(connection)
		@connection = connection
		@connectee1 = connection.connectee1
		@connectee2 = connection.connectee2
		@connector = connection.connector
		@reason = connection.reason
		mail(:to => @connectee2.email,
					:subject => "#{@connectee2.name}, #{@connector.name} wants to make an introduction.")
	end
end
