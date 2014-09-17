class RaceComment < ActiveRecord::Base
	belongs_to :race
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
	validates :race_id, presence: true
	validates :user_id, presence: true

	before_save {self.user_id = self.race_id.user_id}

end
