class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#sign in the user
			sign_in user
			redirect_back_or user
		else
			#create an error message and re-render
			flash.now[:error] = 'Invalid email/password combo'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
