class RaceCommentsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def index
	end

	def create
		@race_comment = current_user.microposts.build(racecomment_params)
		if @race_comment.save
			flash[:success] = "Comment added!"
			redirect_to races_user_path(current_user)
		else
			@feed_items=current_user.feed.paginate(page: params[:page], per_page: 10)
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private
		def micropost_params
			params.require(:micropost).permit(:content)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end
end