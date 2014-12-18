require "rails_helper"

RSpec.describe ItemsController, :type => :controller do

  before do 
    @item = double(Item)

    @standup = double(Standup)
    @standups = double("standups")

    @user = double(User, :standups => @standups)
    allow(request.env["warden"]).to receive(:authenticate!) { @user }
    allow(controller).to receive(:current_user) { @user }
  end

  describe "GET new" do
  end

  describe "POST create" do
  end

  describe "GET edit" do

    before do
      allow(@user).to receive_message_chain(:standups, :find).
                   and_return(@standup)
      allow(@standup).to receive_message_chain(:items, :find).
                      and_return(@item)
    end

    it "returns http success" do
      xhr :get, :edit, :format => "js", :standup_id => 42, :id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the edit template" do
      xhr :get, :edit, :format => "js", :standup_id => 42, :id => 42
      expect(response).to render_template("edit")
    end

    it "assigns @standup" do
      xhr :get, :edit, :format => "js", :standup_id => 42, :id => 42
      expect(assigns(:standup)).to eql(@standup)
    end

    it "assigns @item" do
      xhr :get, :edit, :format => "js", :standup_id => 42, :id => 42
      expect(assigns(:item)).to eql(@item)
    end

  end

  describe "POST update" do
  end

  describe "GET confirm_destroy" do
  end

  describe "DELETE destroy" do
  end

end
