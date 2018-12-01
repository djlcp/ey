class Request < ApplicationRecord
	enum leave_type: {
		holiday: 1,
		illness: 2,
		study_leave: 3
	}

	enum approval: [:pending, :approved, :declined]

	belongs_to :user

	validates(:end, :start, :leave_type, presence: true)

end
