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

  enum role: { standard: 1, hr: 2 }

  # Each user has a manager and a counsellor
  belongs_to :manager, class_name: 'User'
  belongs_to :counsellor, class_name: 'User'

  has_many :approval_requests, foreign_key: :approver_id
  # Each user can be the manager or counsellor of many users
  has_many :managed_users, foreign_key: :manager_id, class_name: 'User'
  has_many :counselled_users, foreign_key: :counsellor_id, class_name: 'User'

  scope :all_except, ->(user) { where.not(id: user.id) }
  scope :managers, -> { where(is_manager: true) }

  def full_name
    first_name + ' ' + last_name
  end

  def managed_user_requests
    Request.kept.where(id: managed_users.map { |user| user.requests.ids }.flatten)
  end

  def requests_for_approval
    managed_user_request_ids = managed_users.map { |user| user.requests.ids }.flatten
    counselled_users_request_ids = counselled_users.map { |user| user.requests.id }.flatten
    Request.kept
      .where(id: [managed_user_request_ids, counselled_users_request_ids].flatten )
  end

  def approval_request_for(request)
    request.approval_requests.find_by(approver: self)
  end

  def request_overlaps?(request)
    overlapping_requests(request).present?
  end

  def overlapping_requests(request)
    managed_user_requests.joins(:user).where(
      'start >= :start_date AND end <= :end_date',
      start_date: request.start,
      end_date: request.end
    ).where(
      users: { manager_id: self.id }
    ).where.not(id: request.id)
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

  def send_request_revoked_emails(request)
    %w[manager counsellor].each do |type|
      ApprovalRequestMailer.request_revoked(
        recipient: send(type),
        request: request
      ).deliver_now
    end
    ApprovalRequestMailer.request_successfully_revoked(
      user: self,
      request: request
    ).deliver_now
  end

  after_initialize do
    self.role ||= :standard if new_record?
  end
end
