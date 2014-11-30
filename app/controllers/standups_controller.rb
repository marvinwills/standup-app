class StandupsController < ApplicationController

	respond_to :html, :js
	
	def index
		user = User.find(params[:user_id])
		@standups = user.standups
	end
	
	def create
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.build

		@standup.save
		redirect_to user_standups_path(user)
	end
	
	def destroy
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.find(params[:id])
		@standup.destroy
	end
	
end
