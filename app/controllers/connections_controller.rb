 class ConnectionsController < ApplicationController

 	# instantiate new connection object #
 	def new
		@connection = Connection.new
		# @connection.build_connectee1
  #   @connection.build_connectee2
  #   @connection.build_connector
  # 	redirect_to new_permission_path
 	end

	# save attributes to connection #
	def create
		@connection = Connection.new params[:connection]
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

	def accept
		@connection = Connection.find params[:connection_id]
		@connection.accept(params[:cid])
	end

	def deny
		@connection = Connection.find params[:connection_id]
		@connection.deny(params[:cid])
	end
 end