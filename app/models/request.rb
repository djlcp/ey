class Request < ApplicationRecord
	LEAVE_TYPES = [['Holiday', 1], ['Illness', 2], ['Study Leave', 3], ['Maternity', 4], ['Paternity', 5], ['Unpaid', 6], ['Other', 7]]

	enum leave_type: {
		holiday: 1,
		illness: 2,
		study_leave: 3,
    maternity: 4,
    paternity: 5,
    unpaid: 6,
    other: 7
	}



	enum approval: [:pending, :approved, :declined]

	belongs_to :user

	def as_event
		{ title: description, end: self.end, start: start }
	end
	validates(:end, :start, :leave_type, presence: true)
end
