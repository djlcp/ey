class AcceptController < ApplicationController
	def index
		@token = params[:token]
		# send out a url with a string on the end
		# user clicks that, grabs string from url
		# string assigned to a request
		# @users = User.all
		# @requests = Request.all
		# @approval_requests = ApprovalRequest.last
	end
end
