class StandupsController < ApplicationController

	def index
		@standups = Standup.all
	end
	
	def new
		@standup = Standup.new
		
		3.times{
			@standup.yesterday_items.build
			@standup.today_items.build
		}
	end
	
	def create
		@standup = Standup.new(standup_params)
		
		@standup.date = Date.today

		if @standup.save
			redirect_to standups_path
		else
			render 'new'
		end
	end
	
	def edit
		@standup = Standup.find(params[:id])
		
		(3-@standup.yesterday_items.count).times{ @standup.yesterday_items.build }
		(3-@standup.today_items.count).times{ @standup.today_items.build }
	end
	
	def update
		@standup = Standup.find(params[:id])
 
		if @standup.update(standup_params)
			redirect_to standups_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@standup = Standup.find(params[:id])
		@standup.destroy
 
		redirect_to standups_path
	end
	
	private
	def standup_params
		params.require(:standup).permit(:date, yesterday_items_attributes: [:id, 1, :item, :_destroy], today_items_attributes: [:id, 1, :item, :_destroy])
	end
	
end
