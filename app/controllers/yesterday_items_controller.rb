class YesterdayItemsController < ApplicationController

  respond_to :html, :js

  def new
    @user = User.find(params[:user_id])
    @standup = @user.standups.find(params[:standup_id])
    @yesterday_item = @standup.yesterday_items.build
  end

  def create
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @yesterday_item = @standup.yesterday_items.build(yesterday_item_params)

    @yesterday_item.save
  end

  def edit
    @user = User.find(params[:user_id])
    @standup = @user.standups.find(params[:standup_id])
    @yesterday_item = @standup.yesterday_items.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @yesterday_item = @standup.yesterday_items.find(params[:id])

    @yesterday_item.update(yesterday_item_params)
  end

  def delete
    user = User.find(params[:user_id])
    standups = user.standups
    @standup = standups.find(params[:standup_id])
    @yesterday_item = @standup.yesterday_items.find(params[:yesterday_item_id])
  end

  def destroy
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @yesterday_items = @standup.yesterday_items
    @yesterday_item = @yesterday_items.find(params[:id])

    @yesterday_item.destroy
  end

  private 
  def yesterday_item_params
    params.require(:yesterday_item).permit(:item)
  end
end
