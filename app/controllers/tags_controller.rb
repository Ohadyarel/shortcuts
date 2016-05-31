class TagsController < ApplicationController
	
	# def show
	# 	if params[:search]
	# 		@tags = Tag.search(params[:search]).order("created_at DESC")
	# 	else
	# 		@tags = Tag.all.order('created_at DESC')
	# 	end
	# end

	def create
		@tag = Tag.new(category: params[:tag][:category])
		@tag.save
	end
end
