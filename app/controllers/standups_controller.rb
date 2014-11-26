class StandupsController < ApplicationController

	def index
	end
	
	def new
		@standup = Standup.new
		
		#@standup.yesterday_items.build
		#@standup.today_items.build
	end
	
	def create
		@standup = Standup.new

		#if @standup.save
			redirect_to standups_path
		#else
		#	render 'new'
		#end
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end
	
end
