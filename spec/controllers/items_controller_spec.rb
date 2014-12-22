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

    before do
      allow(@user).to receive_message_chain(:standups, :find).
                   and_return(@standup)
      allow(@standup).to receive_message_chain(:items, :build).
                      and_return(@item)
    end

    it "returns http success" do
      xhr :get, :new, :format => "js", :standup_id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      xhr :get, :new, :format => "js", :standup_id => 42
      expect(response).to render_template("new")
    end

    it "assigns @standup" do
      xhr :get, :new, :format => "js", :standup_id => 42
      expect(assigns(:standup)).to eql(@standup)
    end

    it "assigns @item" do
      xhr :get, :new, :format => "js", :standup_id => 42
      expect(assigns(:item)).to eql(@item)
    end

    context "today item" do
      it "flashes true" do
        xhr :get, :new, :format => "js", :standup_id => 42, :type => "today"
        expect(flash[:today]).to match(true)
      end
    end

    context "yesterday item" do
      it "flashes false" do
        xhr :get, :new, :format => "js", :standup_id => 42, :type => "yesterday"
        expect(flash[:today]).to match(false)
      end
    end

  end

  describe "POST create" do

    before do
      allow(@standups).to receive(:find) { @standup }
      allow(@standup).to receive_message_chain(:items, :build) { @item }
      allow(@item).to receive(:today=)
      allow(@item).to receive(:save) { true }
    end

    it { is_expected.to permit(:content).for(:create, 
                                             :params => { :item => { :content => "Some content" }, 
                                             :format => "js", :standup_id => 42 } ) }

    it "returns http success" do
      xhr :post, :create, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the create template" do
      xhr :post, :create, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42
      expect(response).to render_template("create")
    end

    it "assigns @standups" do
      xhr :post, :create, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42
      expect(assigns(:standups)).to eql(@standups)
    end

    it "assigns @item" do
      xhr :post, :create, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42
      expect(assigns(:item)).to eql(@item)
    end

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

    before do
      allow(@standups).to receive(:find) { @standup }
      allow(@standup).to receive_message_chain(:items, :find) { @item }
      allow(@item).to receive(:update) { true }
    end

    it { is_expected.to permit(:content).for(:update, 
                                             :params => { :item => { :content => "Some content" }, 
                                             :format => "js", :standup_id => 42, :id => 42 } ) }

    it "returns http success" do
      xhr :post, :update, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42, :id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the update template" do
      xhr :post, :update, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42, :id => 42
      expect(response).to render_template("update")
    end

    it "assigns @standups" do
      xhr :post, :update, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42, :id => 42
      expect(assigns(:standups)).to eql(@standups)
    end

    it "assigns @item" do
      xhr :post, :update, :item => { :content => "Some content" },
          :format => "js", :standup_id => 42, :id => 42
      expect(assigns(:item)).to eql(@item)
    end
  end

  describe "GET confirm_destroy" do

    before do
      allow(@user).to receive_message_chain(:standups, :find).
                   and_return(@standup)
      allow(@standup).to receive_message_chain(:items, :find).
                      and_return(@item)
    end

    it "returns http success" do
      xhr :get, :confirm_destroy, :format => "js", :standup_id => 42, :item_id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the confirm_destroy template" do
      xhr :get, :confirm_destroy, :format => "js", :standup_id => 42, :item_id => 42
      expect(response).to render_template("confirm_destroy")
    end

    it "assigns @standup" do
      xhr :get, :confirm_destroy, :format => "js", :standup_id => 42, :item_id => 42
      expect(assigns(:standup)).to eql(@standup)
    end

    it "assigns @item" do
      xhr :get, :confirm_destroy, :format => "js", :standup_id => 42, :item_id => 42
      expect(assigns(:item)).to eql(@item)
    end

  end

  describe "DELETE destroy" do

    before do
      allow(@standups).to receive(:find) { @standup }
      allow(@standup).to receive_message_chain(:items, :find) { @item }
      allow(@item).to receive(:destroy) { true }
    end

    it "returns http success" do
      xhr :delete, :destroy, :format => "js", :standup_id => 42, :id => 42
      expect(response).to have_http_status(:success)
    end

    it "renders the delete template" do
      xhr :delete, :destroy, :format => "js", :standup_id => 42, :id => 42
      expect(response).to render_template("destroy")
    end

    it "assigns @standups" do
      xhr :delete, :destroy, :format => "js", :standup_id => 42, :id => 42
      expect(assigns(:standups)).to eql(@standups)
    end

    it "assigns @item" do
      xhr :delete, :destroy, :format => "js", :standup_id => 42, :id => 42
      expect(assigns(:item)).to eql(@item)
    end

  end
end
