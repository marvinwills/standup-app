require "rails_helper"

RSpec.describe Item, :type => :model do

  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:today).of_type(:boolean) }
  it { is_expected.to have_db_column(:standup_id).of_type(:integer) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  it { is_expected.to belong_to(:standup) }

  it { is_expected.to validate_presence_of(:standup) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to ensure_length_of(:content).is_at_least(5) }
  it { is_expected.to validate_inclusion_of(:today).in_array([true, false]) }

  describe "scopes" do
    before do
      user = User.create!(:email => "test@test.test", 
                          :username => "testusername",
                          :password => "testpassword")

      @standup = user.standups.create!

      @today_item_1 = @standup.items.create!(:content => "some content", :today => true)
      @today_item_2 = @standup.items.create!(:content => "some content", :today => true)
      @yesterday_item_1 = @standup.items.create!(:content => "some content", :today => false)
      @yesterday_item_2 = @standup.items.create!(:content => "some content", :today => false)
    end

    describe ".today_items" do
      subject { @standup.items.today_items }
      it      { is_expected.to contain_exactly(@today_item_1, @today_item_2) }
    end

    describe ".yesterday_items" do
      subject { @standup.items.yesterday_items }
      it      { is_expected.to contain_exactly(@yesterday_item_1, @yesterday_item_2) }
    end
  end
end
