class ItemsController < ApplicationController

  respond_to :html, :js

  def new
    @user = User.find(params[:user_id])
    @standup = @user.standups.find(params[:standup_id])
    @item = @standup.today_items.build
  end

  def create
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @item = @standup.today_items.build(item_params)

    @item.save
  end

  def edit
    @user = User.find(params[:user_id])
    @standup = @user.standups.find(params[:standup_id])
    @item = @standup.today_items.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @item = @standup.today_items.find(params[:id])

    @item.update(item_params)
  end

def delete
    user = User.find(params[:user_id])
    standups = user.standups
    @standup = standups.find(params[:standup_id])
    @item = @standup.today_items.find(params[:item_id])
  end

  def destroy
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @items = @standup.today_items
    @item = @items.find(params[:id])
    @item.destroy
  end

  private 
  def item_params
    params.require(:item).permit(:content)
  end

end
