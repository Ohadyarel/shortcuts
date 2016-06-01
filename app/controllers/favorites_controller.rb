class FavoritesController < ApplicationController
	def create
		@favorite = Favorite.new(user_id: current_user.id, hack_id: params[:id] )	
		@hack = Hack.find(params[:id])
		respond_to do |format|
			if @favorite.save
				format.js
			else
				format.html { redirect_to :back }
			end
		end
	end

	def destroy
		@favorite = Favorite.find(params[:id])
		@hack = Hack.find(@favorite.hack_id)
		@favorite.destroy
		respond_to do |format|
			format.js
		end 
	end
end
