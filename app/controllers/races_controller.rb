class RacesController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def new
		@race = Race.new
	end

	def create
		@race = current_user.races.build(race_params)
		if @race.save
			flash[:success] = "Race added."
			redirect_to root_url
		else
			@feed_items=current_user.feed.paginate(page: params[:page])
			render @user
		end
	end

	def destroy
		@race.destroy
		render root_url
	end

	private
		def race_params
			params.require(:race).permit(:name, 
										 :bibnumber,
										 :time,
										 :date,
										 :split,
										 :photos,
										 :description)
		end

		def correct_user
			@race = current_user.races.find_by(id: params[:id])
			redirect_to root_url if @race.nil?
		end
end