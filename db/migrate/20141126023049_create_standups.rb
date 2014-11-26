class CreateStandups < ActiveRecord::Migration
  def change
	#drop_table :standups
    create_table :standups do |t|

      t.timestamps
    end
  end
end
