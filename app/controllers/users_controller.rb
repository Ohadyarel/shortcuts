class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save
		log_in(@user)
		redirect_to root_path
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def destroy
		@user = current_user
		@user.destroy
		log_out
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :email)
	end
end
