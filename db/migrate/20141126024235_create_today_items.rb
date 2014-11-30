class CreateTodayItems < ActiveRecord::Migration
  def change
	#drop_table :today_items
    create_table :today_items do |t|
      t.text :item
	  t.references :standup, index: true
	  
	  t.datetime :created_at

      t.timestamps
    end
  end
end
