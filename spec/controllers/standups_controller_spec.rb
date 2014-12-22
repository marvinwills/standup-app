require "rails_helper"

RSpec.describe StandupsController, :type => :controller do

  before do 
    standup = double(Standup, :save => true)
    @standups = double("standups", :build => standup)

    user = double(User, :standups => @standups)
    allow(request.env["warden"]).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
  end

  describe "GET index" do
  
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @standups" do
      get :index
      expect(assigns(:standups)).to eql(@standups)
    end

  end

  describe "POST create" do

    it "returns http success" do
      post :create, :format => "js"
      expect(response).to have_http_status(:success)
    end

    it "renders the create template" do
      post :create, :format => "js"
      expect(response).to render_template("create")
    end

    it "assigns @standups" do
      post :create, :format => "js"
      expect(assigns(:standups)).to eql(@standups)
    end

  end
end
