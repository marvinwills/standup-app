class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :content
      t.boolean :today
      t.references :standup, index: true

      t.datetime :created_at

      t.timestamps
    end
  end
end
