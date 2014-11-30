class TodayItemsController < ApplicationController

	respond_to :html, :js
	
	def new
		@user = User.find(params[:user_id])
		@standup = @user.standups.find(params[:standup_id])
		@today_item = @standup.today_items.build
	end
	
	def create
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.find(params[:standup_id])
		@today_item = @standup.today_items.build(today_item_params)

		@today_item.save
	end
	
	def edit
		@user = User.find(params[:user_id])
		@standup = @user.standups.find(params[:standup_id])
		@today_item = @standup.today_items.find(params[:id])
	end
	
	def update
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.find(params[:standup_id])
		@today_item = @standup.today_items.find(params[:id])
 
		@today_item.update(today_item_params)
	end
	
	def delete
		user = User.find(params[:user_id])
		standups = user.standups
		@standup = standups.find(params[:standup_id])
		@today_item = @standup.today_items.find(params[:today_item_id])
	end
	
	def destroy
		user = User.find(params[:user_id])
		@standups = user.standups
		@standup = @standups.find(params[:standup_id])
		@today_items = @standup.today_items
		@today_item = @today_items.find(params[:id])
		@today_item.destroy
	end
	
	private 
	def today_item_params
		params.require(:today_item).permit(:item)
	end

end
