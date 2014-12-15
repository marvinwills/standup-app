class ItemsController < ApplicationController

  respond_to :html, :js

  before_action :authenticate_user!

  def new
    @standup = current_user.standups.find(params[:standup_id])
    @item = @standup.items.build
    flash[:today] = params[:type] == "today"
  end

  def create
    @standups = current_user.standups
    standup = @standups.find(params[:standup_id])
    @item = standup.items.build(item_params)
    @item.today = flash[:today]
    @item.save
  end

  def edit
    @standup = current_user.standups.find(params[:standup_id])
    @item = @standup.items.find(params[:id])
  end

  def update
    @standups = current_user.standups
    standup = @standups.find(params[:standup_id])
    @item = standup.items.find(params[:id])
    @item.update(item_params)
  end

  def confirm_destroy
    @standup = current_user.standups.find(params[:standup_id])
    @item = @standup.items.find(params[:item_id])
  end

  def destroy
    @standups = current_user.standups
    standup = @standups.find(params[:standup_id])
    @item = standup.items.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:content)
  end
end
