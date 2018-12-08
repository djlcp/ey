class AcceptController < ApplicationController

	def index
		@token = params[:token]
		@approval_req = ApprovalRequest.where(token: params[:token])

		end

#https://apidock.com/rails/ActiveRecord/Base/find/class

		# send out a url with a string on the end
		# user clicks that, grabs string from url
		# string assigned to a request
end
