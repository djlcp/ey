class ApprovalRequest < ApplicationRecord
  has_secure_token :token

  belongs_to :request
  belongs_to :approver, class_name: 'User'
end
