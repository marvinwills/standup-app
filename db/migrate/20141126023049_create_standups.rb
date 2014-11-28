class CreateStandups < ActiveRecord::Migration
  def change
	#drop_table :standups
    create_table :standups do |t|
	
	  t.datetime :created_at
	  
	  t.references :user, index: true

      t.timestamps
    end
  end
end
