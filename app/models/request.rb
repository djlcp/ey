class Request < ApplicationRecord
	enum leave_type: {
		holiday: 1,
		illness: 2,
		study_leave: 3
	}

	belongs_to :user

	validates(:end, :start, :leave_type, presence: true)

end
