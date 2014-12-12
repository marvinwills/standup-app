class ItemsController < ApplicationController

  respond_to :html, :js

  before_action :find_item, :only => [:edit, :update, :destroy]

  def find_item
    @user = User.find(params[:user_id])
    @standups = @user.standups
    @standup = @standups.find(params[:standup_id])
    @items = @standup.items
    @item = @items.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @standup = @user.standups.find(params[:standup_id])
    @item = @standup.items.build
    flash[:today] = params[:type] == "today"
  end

  def create
    user = User.find(params[:user_id])
    @standups = user.standups
    @standup = @standups.find(params[:standup_id])
    @item = @standup.items.build(item_params)
    @item.today = flash[:today]
    @item.save
  end

  def edit
  end

  def update
    @item.update(item_params)
  end

  def delete
    user = User.find(params[:user_id])
    standups = user.standups
    @standup = standups.find(params[:standup_id])
    @item = @standup.items.find(params[:item_id])
  end

  def destroy
    @item.destroy
  end

  private 
  def item_params
    params.require(:item).permit(:content)
  end

end
