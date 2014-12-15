class DropTodayItems < ActiveRecord::Migration
  def change
    drop_table :today_items
  end
end
