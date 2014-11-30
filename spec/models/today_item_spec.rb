require 'rails_helper'

RSpec.describe TodayItem, :type => :model do
    it "validates items" do
	
	#seutp
	
	  TodayItem.delete_all
	
	#excercise
	
	  correct = TodayItem.create(item: "correct_item")
	  incorrect0 = TodayItem.create(item: "not")
	  incorrect1 = TodayItem.create(item: "")
	
	#verify
	
	  expect(TodayItem.all).to eq([correct])
	
	#teardown
  end
end
