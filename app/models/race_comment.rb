class RaceComment < ActiveRecord::Base
	belongs_to :race
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
	validates :race_id, presence: true
	validates :user_id, presence: true

	def comment_feed
		RaceComment.where()
	end
	# before_save {self.user_id = self.race_id.user_id}

end
