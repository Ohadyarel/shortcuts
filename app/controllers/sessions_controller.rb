class SessionsController < ApplicationController
	def create
		# @user = User.where(email: params[:email]).first
		@user = User.where(username: params[:username]).first
		if @user && @user.authenticate(params[:password])
			log_in(@user)
			flash[:notice] = "You're logged in!"
			redirect_to user_path(@user)
		else
			flash[:alert] = "log in failed"
			# render :new
			redirect_to :back
		end
	end

	def destroy
		log_out
		flash[:notice] = "You've been logged out successfully."
		redirect_to root_path
	end

end
