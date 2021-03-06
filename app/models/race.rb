class Race < ActiveRecord::Base
	has_many :race_comments, foreign_key: "race_id", source: "id", dependent: :destroy
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
			@testtime = self.time.split(':')
			@updatedTime = @testtime.reverse
			@updatedTime.map!.with_index do |k|
				@time = k.to_i
				if @timecarry
					@time += @timecarry
					@timecarry = nil
				end
				if @time >= 60
					@timecarry = @time / 60
					@time = @time %60
				end
				@time = @time.to_s
			end
			@updatedTime = @updatedTime.reverse
			self.time = {hours: @updatedTime[0], minutes: @updatedTime[1], seconds: @updatedTime[2]}
		end
	end

	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships
							 WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
			user_id: user)
	end
end
