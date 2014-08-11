class Race < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true # make sure there is at least a name
	validates :date, presence: true # race also needs a date
	validates :user_id, presence: true # race must be associated with a user
end
