class StandupsController < ApplicationController

	def index
	end
	
	def new
	end
	
	def create
		@standup = Standup.New
		@yesterday_item = @standup.yesterday_items.create(1, :yesterday)
		@today_item = @standup.today_items.create(1, :today)

		if @standup.save
			redirect_to standups_path
		else
			render 'new'
		end
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end
	
end
