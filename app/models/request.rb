class Request < ApplicationRecord
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

  enum approval: %i[pending approved declined]

  has_many :approval_requests
  belongs_to :user

  validates(:end, :start, :leave_type, presence: true)

	# has_secure_token

  def as_event
    { title: description, end: self.end, start: start }
  end
end
