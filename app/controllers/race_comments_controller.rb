class RaceCommentsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :delete_comment, only: :destroy

	def index
	end

	def create
		# @race = Race.where(id: params[:race_id]).first
		@race = Race.where(id: racecomment_params[:race_id]).take
		@race_name = @race.name
		@race_comment = @race.race_comments.build(racecomment_params)
		@race_comment.race_id = @race.id
		@race_comment.user_id = current_user.id;
		if @race_comment.save
			flash[:success] = "Comment added to #{@race_name}!"
			redirect_to race_path(@race) #need to go to original race
		else
			flash[:error] = "Comment error"
			redirect_to race_path(@race) #need to go to original race
		end
	end

	def destroy
		# @race_id = RaceComment.where(race_id: racecomment_params[:race_id])
		# @race = Race.where(id: @race_id).take
		@race_id = @race_comment.race_id
		@race = Race.where(id: @race_id).take
		@race_comment.destroy
		redirect_to race_path(@race)
	end

	private
		def racecomment_params
			params.require(:race_comment).permit(:content, :race_id, :user_id)
		end

		def delete_comment
			@race_comment = RaceComment.find_by(id: params[:id])
		end
end