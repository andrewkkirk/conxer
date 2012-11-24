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
			flash[:notice] = "Connection created successfully!"
			redirect_to @connection
		else
			render :new
		end
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