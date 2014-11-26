class CreateYesterdayItems < ActiveRecord::Migration
  def change
    create_table :yesterday_items do |t|
      t.integer :number
      t.text :item
	  t.references :standup, index: true

      t.timestamps
    end
  end
end
