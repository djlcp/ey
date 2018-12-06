class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, validate_on_invite: true

  validates(
    :email,
    :manager,
    :counsellor,
    :first_name,
    :last_name,
    presence: true
  )

  enum role: %i[standard hr manager]

  # Each user has a manager and a counsellor
  belongs_to :manager, class_name: 'User'
  belongs_to :counsellor, class_name: 'User'

  has_many :approval_requests, foreign_key: :approver_id
  # Each user can be the manager or counsellor of many users
  has_many :managed_users, foreign_key: :manager_id, class_name: 'User'
  has_many :couselled_users, foreign_key: :counsellor_id, class_name: 'User'

  scope :all_except, ->(user) { where.not(id: user.id) }

  def full_name
    first_name + ' ' + last_name
  end

  def send_request_approval_emails(request)
    %w[manager counsellor].each do |type|
      approval_request = send(type).approval_requests.create(request: request)
      ApprovalRequestMailer.request_approval(
        user: self,
        recipient: send(type),
        request: request,
        approval_request: approval_request
      ).deliver_now
    end
  end

  def self.for_select(user)
    all_except(user).map { |user| [user.full_name, user.id] }
  end

  after_initialize do
    self.role ||= :standard if new_record?
  end
end
