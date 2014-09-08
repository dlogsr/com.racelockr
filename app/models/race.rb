class Race < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('date DESC') }
	validates :name, presence: true # make sure there is at least a name
	validates :date, presence: true # race also needs a date
	validates :user_id, presence: true # race must be associated with a user
	serialize :time, Hash
	serialize :splits
	# attr_accessible :time
	before_validation :update_time

	def update_time
		if time_changed? and time.is_a?(String)
			self.time = self.time.split(':')
			self.time = {hours: self.time[0], minutes: self.time[1], seconds: self.time[2]}
		end
	end
end
