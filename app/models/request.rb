class Request < ApplicationRecord
	enum leave_type: {
		holiday: 1,
		illness: 2,
		study_leave: 3
	}

	belongs_to :user

	def as_event
		{ title: description, end: self.end, start: start }
	end
	validates(:end, :start, :leave_type, presence: true)
end
