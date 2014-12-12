class DropYesterdayItems < ActiveRecord::Migration
  def change
    drop_table :yesterday_items
  end
end
