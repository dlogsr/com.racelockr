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
end
