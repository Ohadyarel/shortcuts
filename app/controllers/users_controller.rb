class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@hacks=@user.hacks
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to shortcuts"
			log_in(@user)
			redirect_to root_path
		else
			flash[:alert] = "Something went wrong"
			render :new
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "Sorry! The passwords did not match"
      redirect_to(:back)
    else
			@user.update(user_params)
			flash[:notice] = "User updated"
			redirect_to user_path(@user)
		end
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
