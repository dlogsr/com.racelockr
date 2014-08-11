class StaticPagesController < ApplicationController
  def home
  	if signed_in?
  		@micropost = current_user.microposts.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
      @race_feed = current_user.races.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
