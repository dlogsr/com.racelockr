module RaceCommentsHelper
	def current_race(id)
		@current_race ||= Race.find_by(id: id)
	end

	def racecomment_user(user_id)
		user = User.where(id: user_id).take
	end
end