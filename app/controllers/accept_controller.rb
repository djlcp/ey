class AcceptController < ApplicationController
	before_action :set_approval_request

	def index
		@token = params[:token]
	end

	def approve
		@approval_request.approved!
  	end

  	def reject
  		@approval_request.rejected!
  	end

  	def status
		@approval_request.approval_status
  	end

  	helper_method :approve, :status


  	private

	def set_approval_request
		@approval_request = ApprovalRequest.find_by(token: params[:token])
	end
		# send out a url with a string on the end
		# user clicks that, grabs string from url
		# string assigned to a request
end
