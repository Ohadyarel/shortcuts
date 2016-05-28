class FavoritesController < ApplicationController
	def create
		@favorite = Favorite.new(user_id: current_user.id, hack_id: params[:hack_id] )
		@favorite.save
		redirect_to root_path
		#add respond_to
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		@favorite.destroy
		redirect_to root_path
		#add respond_to
	end
end
