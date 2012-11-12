class ConnectionsController < ApplicationController

	def new
		@connection = Connection.new
		@connection.build_connectee1
		@connection.build_connectee2
	end
	
	def create 
	end

	def edit
		@connection = Connection.find(params[:id])
	end
	
	def update
	end
	
	def show
		@connection.find(params[:id])
	end
end