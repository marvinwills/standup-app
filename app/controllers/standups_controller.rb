class StandupsController < ApplicationController

	def index
	end
	
	def new
	end
	
	def create
		@standup = Standup.New

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
