class StandupsController < ApplicationController

  respond_to :html, :js

  before_action :authenticate_user!

  def index
    @standups = current_user.standups
  end

  def create
    @standups = current_user.standups
    standup = @standups.build

    standup.save
  end

  def destroy
    standup = current_user.standups.find(params[:id])
    standup.destroy
  end
end
