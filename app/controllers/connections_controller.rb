 class ConnectionsController < ApplicationController

 	# instantiate new connection object #
 	def new
		@connection = Connection.new
 	end

	# save attributes to connection #
	def create
		if user_signed_in?
			@connection = Connection.new params[:connection].merge({connector_attributes:
																									current_user.connections_params})
		else
			@connection = Connection.new params[:connection]
		end
		if @connection.save
			redirect_to @connection
		else
			render :new
		end
	end

	def edit
		@connection = Connection.find(params[:id])
	end

	def show
		Connection.find(params[:id])
	end

	def index
		@connections = Connection.current_user
	end

	# accept a connection invitation #
	def accept
		@connection = Connection.find params[:connection_id]
		@connection.accept(params[:cid])
	end

	# reject a connection invitation #
	def deny
		@connection = Connection.find params[:connection_id]
		@connection.deny(params[:cid])
	end
 end