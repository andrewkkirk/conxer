class PermissionsController < ApplicationController

	def new
		@permission = Permission.new params[:connection]
	end

end
