require "rails_helper"

RSpec.describe CommentsController, :type => :controller do

  before do
    @comment = double(Comment)

    @standup = double(Standup)
    allow(@standup).to receive_message_chain(:comments, :build) { @comment }
    @standups = double("standups")
    allow(@standups).to receive(:find) { @standup }

    @user = double(User, :standups => @standups)
    allow(request.env["warden"]).to receive(:authenticate!) { @user }
    allow(controller).to receive(:current_user) { @user }
  end

  describe "GET new" do

    it "returns http success" do
      get :new, :standup_id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new, :standup_id => 42
      expect(response).to render_template("new")
    end

    it "assigns @standup" do
      get :new, :standup_id => 42
      expect(assigns(:standup)).to eql(@standup)
    end

    it "assigns @comment" do
      get :new, :standup_id => 42
      expect(assigns(:comment)).to eql(@comment)
    end



  end

  describe "POST create" do

    before do
      allow(@comment).to receive(:user=) { @user }
      allow(@comment).to receive(:save) { true }
    end

    it do 
      is_expected.to permit(:text).for(:create, 
          :params => { :comment => { :text => "Some text" }, 
          :standup_id => 42 } )
    end

    it "redirects to standups" do
      post :create, :comment => { :text => "Some text" }, :standup_id => 42
      expect(response).to redirect_to(standups_path)
    end

  end
end
