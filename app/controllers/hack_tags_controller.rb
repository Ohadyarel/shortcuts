class HackTagsController < ApplicationController
	def create
	end

	def destroy
		puts "PARARAMAMAMAMAMAMS"
		puts params.inspect
		@hacktag=HackTag.where(tag_id:params[:id],hack_id: params[:hack_id]).first
		@hacktag.destroy

		redirect_to :back
	end
end
