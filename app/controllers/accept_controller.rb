class AcceptController < ApplicationController
	def index
		@token = params[:id]
		# send out a url with a string on the end
		# user clicks that, grabs string from url
		# string assigned to a request
	end
end
