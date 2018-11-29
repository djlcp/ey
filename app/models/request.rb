class Request < ApplicationRecord
	belongs_to :user

	def as_event
		{ title: description, end: self.end, start: start }
	end
end
