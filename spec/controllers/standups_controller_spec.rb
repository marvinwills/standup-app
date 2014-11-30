require 'rails_helper'

RSpec.describe StandupsController, :type => :controller do

  describe "GET index" do
  
    before do
      @user = mock_model(User) 
      @standups = double("standups")
      @user.stub(:standups){ @standups }
      User.stub(:find){ @user }
    end
  
    it "returns http success" do
      get :index, :user_id => 1
      expect(response).to have_http_status(:success)
    end
	
	it "renders the index template" do
	  get :index, :user_id => 1
	  expect(response).to render_template("index")
	end
	
	it "should find user with params[:user_id]" do 
      User.should_receive(:find).with("1").and_return(@user)
      get :index, :user_id => 1
	end
	
	it "should get user's standups" do
      @user.should_receive(:standups).and_return(@standups)
      get :index, :user_id => 1
    end

    it "should assign the found standups for the view" do
      get :index, :user_id => 1
      assigns[:standups].should be(@standups)
    end
  end
	
end

