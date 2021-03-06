class Request < ApplicationRecord
  include Discard::Model
  enum leave_type: {
    annual_leave: 1,
    training: 2,
    illness: 3,
    study_leave: 4,
    maternity: 5,
    paternity: 6,
    unpaid: 7,
    other: 8
  }

  LEAVE_TYPE_COLORS = {
    annual_leave: '#9B59B6',
    training: '#2980B9',
    illness: '#1ABC9C',
    study_leave: '#27AE60',
    maternity: '#F1C40F',
    paternity: '#E67E22',
    unpaid: '#839192',
    other: '#2E4053'
  }

  enum approval: %i[pending approved declined]

  has_many :approval_requests
  belongs_to :user

  validates(:end, :start, :leave_type, presence: true)

  validates_date :start, after: -> { Date.today }
  validate :end_date_after_start

  def end_date_after_start
    return unless start && self.end
    return unless self.end < start

    errors.add(:end, 'date must be before the start date')
  end

  def as_event
    { title: description, end: self.end, start: start }
  end

  after_discard do
    user.send_request_revoked_emails(self)
  end
end
