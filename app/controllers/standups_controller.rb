class StandupsController < ApplicationController

	respond_to :html, :js
	
	def index
		user = User.find(params[:user_id])
		@standups = user.standups
	end
	
	def new
		@user = User.find(params[:user_id])
		@standup = @user.standups.build
		
		3.times{
			@standup.yesterday_items.build
			@standup.today_items.build
		}
	end
	
	def create
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.build(standup_params)

		@standup.save
	end
	
	def edit
		@user = User.find(params[:user_id])
		@standup = @user.standups.find(params[:id])
		
		(3-@standup.yesterday_items.count).times{ @standup.yesterday_items.build }
		(3-@standup.today_items.count).times{ @standup.today_items.build }
	end
	
	def update
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.find(params[:id])
 
		@standup.update(standup_params)
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
