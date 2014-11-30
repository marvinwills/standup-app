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
	end
	
	def delete
		user = User.find(params[:user_id])
		@standup = user.standups.find(params[:standup_id])
	end
	
	def destroy
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.find(params[:id])
		@standup.destroy
	end
	
	private
	def standup_params
		params.require(:standup).permit(yesterday_items_attributes: [:id, :item, :_destroy], today_items_attributes: [:id, :item, :_destroy])
	end
	
end
