class ApprovalRequest < ApplicationRecord
  has_secure_token :token
  enum approval_status: {
    approved: 1,
    rejected: 2,
    awaiting_review: 3
  }

  belongs_to :request
  belongs_to :approver, class_name: 'User'

  after_update :update_request

  def update_request
    return unless approved? || rejected?

    if approved?
      if request.approval_requests.all? { |approval_request| approval_request.approved? }
        ApprovalRequestMailer.request_approved(user: request.user, approval_request: self).deliver_now
        request.approved!
      end
    elsif rejected?
      ApprovalRequestMailer.request_rejected(user: request.user, approval_request: self).deliver_now
      request.declined!
    end
   end
end
