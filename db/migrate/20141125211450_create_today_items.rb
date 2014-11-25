class CreateTodayItems < ActiveRecord::Migration
  def change
    create_table :today_items do |t|
      t.integer :number
      t.text :item

      t.timestamps
    end
  end
end
