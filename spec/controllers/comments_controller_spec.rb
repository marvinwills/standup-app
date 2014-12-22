require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  before do
    @comment = double(Comment)
    allow(Comment). to receive(:new) { @comment }

    @user = double(User)
    allow(request.env["warden"]).to receive(:authenticate!) { @user }
    allow(controller).to receive(:current_user) { @user }
  end

  describe "GET new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end

    it "assigns @comment" do
      get :new
      expect(assigns(:comment)).to eql(@comment)
    end

  end

  describe "POST create" do

    it "redirects to standups" do
      post :create
      expect(response).to redirect_to(standups_path)
    end

  end
end
