class TagsController < ApplicationController
	# show the lifehacks based on the tag search
	def show
		@tag=Tag.find(params[:id])
		@hacks=@tag.hacks
	end
end
