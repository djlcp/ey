class ApprovalRequestController < ApplicationController
  before_action :authenticate_user!
  before_action :set_approval_request
  before_action :authorize_user

  def approve
    @approval_request.approved!
    flash[:success] = 'Request approved'
    redirect_to root_path
  end

  def reject
    @approval_request.rejected!
    flash[:error] = 'Request rejected'
    redirect_to root_path
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
