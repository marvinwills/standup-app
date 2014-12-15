require 'rails_helper'

RSpec.describe Standup, :type => :model do
	
      it "limits standup creation to once a day" do
	
	#seutp
	
	  Standup.delete_all
	
	#excercise
	
	  will_exist = Standup.create(user_id: "TestUser")
	  wont_exist = Standup.create(user_id: "TestUser")
	
	#verify
	
	  expect(Standup.all).to eq([will_exist])
	
	#teardown
  end
end
