require 'rails_helper'

RSpec.describe YesterdayItem, :type => :model do
  it "validates items" do
  
    #seutp
	
	  YesterdayItem.delete_all
	
	#excercise
	
	  correct = YesterdayItem.create(item: "correct_item")
	  incorrect0 = YesterdayItem.create(item: "not")
	  incorrect1 = YesterdayItem.create(item: "")
	
	#verify
	
	  expect(YesterdayItem.all).to eq([correct])
	  
	#breakdown
  end
end
