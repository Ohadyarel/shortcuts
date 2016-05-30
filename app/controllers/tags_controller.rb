class TagsController < ApplicationController
	def create
		@tag = Tag.new(category: params[:tag][:category])
		@tag.save
	end
end
