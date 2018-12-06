class ApprovalRequestController < ApplicationController
  before_action :authenticate_user!
  before_action :set_approval_request
  before_action :authorize_user

  def approve
    @approval_request.approved!
    redirect_to root_path, success: 'Request approved'
  end

  def reject
     @approval_request.rejected!
    redirect_to root_path, success: 'Request rejected'
  end

  private

  def set_approval_request
    @approval_request = ApprovalRequest.find(params[:approval_request_id])
  end

  def authorize_user
    return if @approval_request.approver == current_user

    redirect_to root_url, alert: 'Access Denied'
  end
end
