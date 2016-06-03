class HacksController < ApplicationController
	# for the listing of all lifehacks
	def index

		# search lifehacks with a certain tag
		if params[:search]
			@tag = Tag.where(category:params[:search]).first
			if @tag
				@hacks=@tag.hacks
			else
				@hacks=Hack.all
			end
		else
			@hacks=Hack.all
		end

		#variables for most popular life hacks based on upvotes
		@popular = @hacks.sort_by{ |hack| hack.get_upvotes.size }
		@hackvote = @popular.last(10)
		
		# creates an array to be used for search autocomplete
		@tags=Tag.all
		@arrTags=[]
		@tags.each do |cat|
			@arrTags.push(cat.category)
		end

	  respond_to do |format|
	    format.html
	    format.json {render json: @arrTags}
	  end
	  # end autocomplete
	end

	# find the hack for hack page
	def show
		@hack=Hack.find(params[:id])
	end

	# initializing a new lifehack
	def new
		@hack=Hack.new
		@tag=Tag.new
		@tags=[]

		########### PUT IN HELPER METHOD LATER
		# search lifehacks with a certain tag
		if params[:search]
			@searched_tag = Tag.where(category:params[:search]).first
			if @searched_tag
				@hacks=@searched_tag.hacks
			else
				@hacks=Hack.all	
			end
		else
			@hacks=Hack.all
		end

		# creates an array to be used for search autocomplete
		@search_tags=Tag.all
		@newArr=[]
		@search_tags.each do |cat|
			@newArr.push(cat.category)
		end

	  respond_to do |format|
	    format.html
	    format.json {render json: @newArr}
	  end
	  # end autocomplete
	  ############ END PUT IN HELPER METHOD LATER
	end

	# creating a new lifehack by the user
	def create
		@hack=Hack.new(hack_params)

		if @hack.save
			flash[:notice]="Cool! Your hack has been created!"
		else
			flash[:alert]="Oh no! Your hack was not created"
		end

		# captures the tags and converts to an array
		@allTags = params[:hack][:tags]
		if !@allTags.blank?
			@arrTags = @allTags.split(",").map(&:strip)
			# loop through each tag
			@arrTags.each do |tag|
				# if the tag exists, create the hack tag
				if @tag=Tag.where(category:tag).first
					HackTag.create(tag_id:@tag.id, hack_id:@hack.id)
				else
					@tag=Tag.create(category: tag)
					HackTag.create(tag_id:@tag.id, hack_id:@hack.id)
				end
			end
		end

		redirect_to hacks_path
	end

	# find the lifehack post that the user would like to edit
	def edit
		@hack=Hack.find(params[:id])
		@tag=Tag.new
		@tags=@hack.tags
	end

	# update the lifehack post
	def update
		@hack = Hack.find(params[:id])
		@hack.update(hack_params)

		@allTags = params[:hack][:tags]
		@arrTags = @allTags.split(",").map(&:strip)

		# loop through each tag
		@arrTags.each do |tag|
			# if the tag exists, create the hack tag
			if @tag=Tag.where(category:tag).first
				HackTag.create(tag_id:@tag.id, hack_id:@hack.id)
			else
				@tag=Tag.create(category: tag)
				HackTag.create(tag_id:@tag.id, hack_id:@hack.id)
			end
		end
		redirect_to hacks_path
	end

	# destroy a lifehack :(
	def destroy
		@hack = Hack.find(params[:id])
		@hack.hack_tags.destroy_all
		@hack.favorites.destroy_all
		@hack.destroy
		redirect_to hacks_path
	end

	def upvote
		@hack = Hack.find(params[:id])
		@hack.upvote_by current_user
		respond_to do |format|
			format.js
		end
	end

	def downvote
		@hack = Hack.find(params[:id])
		@hack.downvote_by current_user
		respond_to do |format|
			format.js
		end
	end

	# strong parameters
	private
	def hack_params
    params.require(:hack).permit(:user_id, :title, :body, :lhimg)
	end

end
