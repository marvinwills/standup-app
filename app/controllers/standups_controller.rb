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

		if @standup.save
			redirect_to standups_path
		else
			render 'new'
		end
	end
	
	def edit
		@standup = Standup.new(params[:id])
	end
	
	def update
	end
	
	def destroy
	end
	
	private
	def standup_params
		params.require(:standup).permit(yesterday_items_attributes: [:id, 1, :item, _:destroy], today_items_attributes: [:id, 1, :item, :_destroy])
	end
	
end
