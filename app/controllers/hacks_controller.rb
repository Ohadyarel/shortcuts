class HacksController < ApplicationController
	# for the listing of all lifehacks
	def index
		@hacks=Hack.all
	end

	# find the hack for hack page
	def show
		@hack=Hack.find(params[:id])
	end

	# initializing a new lifehack
	def new
		@hack=Hack.new
		@tag=Tag.new
	end

	# creating a new lifehack by the user
	def create
		@hack=Hack.new(hack_params)

		if @hack.save
			flash[:notice]="Cool! Your hack has been created!"
		else
			flash[:alert]="Oh no! Your hack was not created"
		end
		puts "PARAMMMMMERTERS"

		# captures the tags and converts to an array
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

	# find the lifehack post that the user would like to edit
	def edit
		@hack=Hack.find(params[:id])
		@tag=Tag.new
	end

	# update the lifehack post
	def update
		@hack = Hack.find(params[:id])
		@hack.update(hack_params)
		redirect_to hacks_path
	end

	# destroy a lifehack :(
	def destroy
		@hack = Hack.find(params[:id])
		puts @hack.id
		@hack.destroy
		redirect_to hacks_path
	end

	# strong parameters
	private
	def hack_params
    params.require(:hack).permit(:user_id, :title, :body, :lhimg)
	end

end
