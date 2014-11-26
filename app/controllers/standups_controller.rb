class StandupsController < ApplicationController

	def index
	end
	
	def new
	end
	
	def create
		render plain: params[:standup].inspect
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end
	
end
