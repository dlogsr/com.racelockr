class Race < ActiveRecord::Base
	has_many :race_comments, foreign_key: "race_id", dependent: :destroy
	belongs_to :user
	default_scope -> { order('date DESC') }
	validates :name, presence: true # make sure there is at least a name
	validates :date, presence: true # race also needs a date
	validates :user_id, presence: true # race must be associated with a user
	validates :racetype, presence:true # race needs a type
	serialize :time, Hash
	serialize :splits
	# attr_accessible :time
	before_validation :update_time

	def update_time
		if time_changed? and time.is_a?(String)
			self.time = self.time.split(':')
			# if self.time[1] > 60
			# 	self.time[0] += (self.time[1] / 60)
			# 	self.time[1] = self.time[1] % 60
			# end
			self.time = {hours: self.time[0], minutes: self.time[1], seconds: self.time[2]}
		end
	end

	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships
							 WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
			user_id: user)
	end
end
