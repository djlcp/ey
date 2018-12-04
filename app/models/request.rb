class Request < ApplicationRecord
	LEAVE_TYPES = [['Holiday', 1], ['Illness', 2], ['Study Leave', 3], ['Maternity', 4], ['Paternity', 5], ['Unpaid', 6], ['Other', 7]]

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



	enum approval: [:pending, :approved, :declined]

	belongs_to :user

	def as_event
		{ title: description, end: self.end, start: start }
	end
	validates(:end, :start, :leave_type, presence: true)
end
