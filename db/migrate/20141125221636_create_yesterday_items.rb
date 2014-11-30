class CreateYesterdayItems < ActiveRecord::Migration
  def change
	#drop_table :yesterday_items
    create_table :yesterday_items do |t|
      t.text :item
	  t.references :standup, index: true
	  
	  t.datetime :created_at

      t.timestamps
    end
  end
end
