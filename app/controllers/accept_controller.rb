class AcceptController < ApplicationController
	before_action :set_approval_request
	before_action :validate_token

	def approve
		@approval_request.approved!
		invalidate_token
  	end

	def reject
		@approval_request.rejected!
		invalidate_token
  	end

  	def status
		@approval_request.approval_status
  	end

  	helper_method :approve, :status

  	private

	def set_approval_request
		@approval_request = ApprovalRequest.find_by(token: params[:token])
	end

	def validate_token
		return if @approval_request.token_valid?
		redirect_to root_url, alert: 'Email link expired'
	end

	def invalidate_token
		@approval_request.token_valid = false
		@approval_request.save
	end

end
