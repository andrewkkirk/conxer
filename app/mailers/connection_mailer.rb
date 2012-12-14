class ConnectionMailer < ActionMailer::Base
  default from: "andrew@andrewkkirk.com"

	def connectee1_email(connection)
		@connection = connection
		@connectee1 = connection.connectee1
		@connectee2 = connection.connectee2
		@connector = connection.connector
		@reason = connection.reason
		mail(:to => @connectee1.email,
					:subject => "#{@connectee1.name}- #{@connector.name} wants to introduce you to #{@connectee2.name}")
	end

	def connectee2_email(connection)
		@connection = connection
		@connectee1 = connection.connectee1
		@connectee2 = connection.connectee2
		@connector = connection.connector
		@reason = connection.reason
		mail(:to => @connectee2.email,
					:subject => "#{@connectee2.name}- #{@connector.name} wants to introduce you to #{@connectee1.name}")
	end

	def connection_established_email(connection)
		@connection = connection
		@connectee1 = connection.connectee1
		@connectee2 = connection.connectee2
		@connector = connection.connector
		@reason = connection.reason
			mail(:to => @connectee1.email,
						:cc => @connectee2.email,
					:subject => "#{@connector.name} made you a new introduction.")
	end

	def notify_connector(connection)
		@connection = connection
		@connectee1 = connection.connectee1
		@connectee2 = connection.connectee2
		@connector = connection.connector
		@reason = connection.reason
			mail(:to => @connector.email,
							:subject => "Your connection was successful. #{@connectee1.name} and #{@connectee2.name} are now connected.")
	end
end
