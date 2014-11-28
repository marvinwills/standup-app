class StandupsController < ApplicationController

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
		@standup = user.standups.build(standup_params)

		if @standup.save
			redirect_to user_standups_path(user)
		else
			render 'new'
		end
	end
	
	def edit
		@user = User.find(params[:user_id])
		@standup = @user.standups.find(params[:id])
		
		(3-@standup.yesterday_items.count).times{ @standup.yesterday_items.build }
		(3-@standup.today_items.count).times{ @standup.today_items.build }
	end
	
	def update
		user = User.find(params[:user_id])
		@standup = user.standups.find(params[:id])
 
		if @standup.update(standup_params)
			redirect_to user_standups_path(user)
		else
			render 'edit'
		end
	end
	
	def destroy
		user = User.find(params[:user_id])
		@standup = user.standups.find(params[:id])
		@standup.destroy
 
		redirect_to user_standups_path(user)
	end
	
	private
	def standup_params
		params.require(:standup).permit(yesterday_items_attributes: [:id, 1, :item, :_destroy], today_items_attributes: [:id, 1, :item, :_destroy])
	end
	
end
