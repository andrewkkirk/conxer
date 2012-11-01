class ConnectionsController < ApplicationController

	def new
		@connection = Connection.new
		@connection.build_connectee1
		@connection.build_connectee2
	end

end