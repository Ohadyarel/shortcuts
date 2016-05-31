class HackTagsController < ApplicationController
	def destroy
		@hacktag=HackTag.where(tag_id:params[:id],hack_id: params[:hack_id]).first
		@hacktag.destroy

		redirect_to :back
	end
end
