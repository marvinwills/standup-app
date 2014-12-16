require 'rails_helper'

RSpec.describe User, :type => :model do

  it "validates username" do
	
	#seutp
	
	  User.delete_all
	
	#excercise
	
	  correct = User.create!(username: "Correct Username", email: "some@mail.test", password: "changeme")
	  incorrect0 = User.create(username: "not", email: "some@mail.test", password: "changeme")
	  incorrect1 = User.create(username: "", email: "some@mail.test", password: "changeme")
	
	#verify
	
	  expect(User.all).to eq([correct])
	
	#teardown
  end
end

RSpec.describe User, :type => :model do
  it "validates email" do
	
	#seutp
	
	  User.delete_all
	
	#excercise
	
	  correct = User.create!(username: "Correct Username", email: "some@mail.test", password: "changeme")
	  incorrect0 = User.create(username: "Correct Username", email: "", password: "changeme")
	  incorrect1 = User.create(username: "Correct Username", email: "invalid email", password: "changeme")
	
	#verify
	
	  expect(User.all).to eq([correct])
	
	#teardown
  end
end

RSpec.describe User, :type => :model do
  it "validates password" do
	
	#seutp
	
	  User.delete_all
	
	#excercise
	
	  correct = User.create!(username: "Correct Username", email: "some@mail.test", password: "changeme")
	  incorrect0 = User.create(username: "Correct Username", email: "some@mail.test", password: "")
	  incorrect1 = User.create(username: "Correct Username", email: "some@mail.test", password: "not")
	
	#verify
	
	  expect(User.all).to eq([correct])
	
	#teardown
  end
end

