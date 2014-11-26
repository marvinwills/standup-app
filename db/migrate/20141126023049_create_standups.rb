class CreateStandups < ActiveRecord::Migration
  def change
    create_table :standups do |t|

      t.timestamps
    end
  end
end
