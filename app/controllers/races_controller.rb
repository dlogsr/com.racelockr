class RacesController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update, :create, :destroy]
	before_action :correct_user, only:[:edit, :update, :destroy]

	def show
		if Race.find(params[:id])
			@race = Race.find(params[:id])
			@user = @race.user
			@race_comment = @race.race_comments.build
			@current_race_comments = RaceComment.where(race_id: params[:id]).paginate(page: params[:page], per_page: 10)
		elsif signed_in?
		  flash[:error] = "That race does not exist."
		  redirect_to root_url
		end
	end

	def new
		@race = Race.new
	end

	def create
		@race = current_user.races.build(race_params)
		@race.time = @race.time.split(':')
		@updatedTime = @race.time.reverse
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
		@race.time = {hours: @updatedTime[0], minutes: @updatedTime[1], seconds: @updatedTime[2]}
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
			redirect_to race_path(@race)
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