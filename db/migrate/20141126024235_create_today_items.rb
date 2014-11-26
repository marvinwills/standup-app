class CreateTodayItems < ActiveRecord::Migration
  def change
	drop_table :today_items
    create_table :today_items do |t|
      t.integer :number
      t.text :item
	  t.references :standup, index: true

      t.timestamps
    end
  end
end
