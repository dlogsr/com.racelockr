module RaceCommentsHelper
	def current_race(id)
		@current_race ||= Race.find_by(id: id)
	end
end