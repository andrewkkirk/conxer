class ConnectionsController < ApplicationController

	def new
		@connection = Connection.new
		@connection.build_connectee1
		@connection.build_connectee2
	end
	
	def create
		@connection= Connection.create params[:connection]
		ConnectionMailer.connectee1_email(@connection.connectee1).deliver
		ConnectionMailer.connectee2_email(@connection.connectee2).deliver
		redirect_to connection_path(@connection)
	end

	def edit
		@connection = Connection.find(params[:id])
	end
	
	def update
	end
	
	def show
		Connection.find(params[:id])
	end
end