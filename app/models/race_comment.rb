class RaceComment < ActiveRecord::Base
	belongs_to :race_id
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true
	validates :race_id, presence: true

end
