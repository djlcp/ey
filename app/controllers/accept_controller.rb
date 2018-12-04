class AcceptController < ApplicationController
	def index
		@token = params[:id]
	end
end
