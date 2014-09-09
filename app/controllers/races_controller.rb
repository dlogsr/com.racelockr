class RacesController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :create, :destroy]
	before_action :correct_user, only:[:edit, :update, :destroy]

	def new
		@race = Race.new
	end

	def create
		@race = current_user.races.build(race_params)
		@race.time = @race.time.split(':')
		@race.time = {hours: @race.time[0], minutes: @race.time[1], seconds: @race.time[2]}
		if @race.save
			flash[:success] = "Race added."
			redirect_to races_user_path(current_user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @race.update_attributes(race_params)
			flash[:success] = "Race updated."
			redirect_to races_user_path(current_user)
		else
			render 'edit'
		end
	end

	def destroy
		@race.destroy
		redirect_to races_user_path(current_user)
	end

	private
		def race_params
			params.require(:race).permit(:name,
										 :racetype,
										 :distance, 
										 :bibnumber,
										 :date,
										 :time,
										 :split,
										 :photos,
										 :location,
										 :description)
		end

		def correct_user
			@race = current_user.races.find_by(id: params[:id])
			redirect_to root_url if @race.nil?
		end
end