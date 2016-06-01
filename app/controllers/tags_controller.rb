class TagsController < ApplicationController
	# show the lifehacks based on the tag search
	def show
		puts "WHAT AM I GETTING?"
		params.inspect
		# @hacks=Tag.where(category:params)
	end
end
