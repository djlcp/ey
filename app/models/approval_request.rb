class ApprovalRequest < ApplicationRecord
  has_secure_token :token
  enum approval_status: {
    approved: 1,
    rejected: 2,
    awaiting_review: 3
  }

  belongs_to :request
  belongs_to :approver, class_name: 'User'
end
