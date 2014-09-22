module RacesHelper
	def racetype_given(type)
		case type
		when 1
			"Running"
		when 2
			"Swimming"
		when 3
			"Biking"
		when 4
			"Triathlon"
		end
	end

	#can you pass full model instances to a helper class?
	def racepace(time,distance)
		pace_total = (time[:hours].to_i * 60 + time[:minutes].to_i + time[:seconds].to_f / 60) / distance
		# pace = (time[:hours].to_i * 60 + time[:minutes] + time[:seconds] / 60) / distance
		pace_seconds = ( pace_total % 1 * 60 ).truncate
		pace = pace_total.truncate.to_s + ":" + pace_seconds.to_s
		pace
	end
end
