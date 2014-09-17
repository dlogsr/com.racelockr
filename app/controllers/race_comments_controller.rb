class RaceCommentsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	# before_action :correct_user, only: :destroy

	def index
	end

	def create
		@race = Race.find_by(params[:race_id])
		@race_name = @race.name
		@race_comment = @race.race_comments.build(racecomment_params)
		@race_comment.race_id = @race.id
		@race_comment.user_id = current_user.id;
		if @race_comment.save
			flash[:success] = "Comment added to #{@race_name}, race id #{(@race.id)}, given as #{params[:race_id]}!"
			redirect_to races_user_path(current_user) #need to go to original race
		else
			flash[:error] = "did not work."
			redirect_to races_user_path(current_user) #need to go to original race
		end
	end

	def destroy
		@race_comment.destroy
		redirect_to root_url
	end

	private
		def racecomment_params
			params.require(:race_comment).permit(:content, :race_id, :user_id)

		end
end