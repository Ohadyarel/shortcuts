class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@hacks=@user.hacks
		@fav_hacks=Favorite.where(user_id: current_user.id).all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		
		# check that the passwords match
		if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "Sorry! The passwords did not match"
      redirect_to(:back)
    else
    	# save the user and redirect to root
			if @user.save
				flash[:notice] = "Welcome to Shortcuts!"
				log_in(@user)
				redirect_to root_path
			end
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
		@user.hacks.delete_all
		@user.favorites.delete_all
		@user.destroy
		log_out
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :email)
	end
end
