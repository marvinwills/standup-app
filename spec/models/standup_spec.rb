require "rails_helper"

RSpec.describe Standup, :type => :model do

  it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:items).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:user) }

  before do 
    @user = User.create!(:email => "test@test.test", 
                         :username => "testusername",
                         :password => "testpassword")
  end

  describe "standup creation" do

    describe "creating todays first standup" do
      subject { @user.standups.create }
      it      { is_expected.to be_valid }
    end

    describe "creating another standup the same day" do
      before  { @user.standups.create }
      subject { @user.standups.create }
      it      { is_expected.not_to be_valid }
    end

    describe "creating another standup the next day" do
      before  { @user.standups.create }
      subject { Timecop.travel(1.day.from_now) { @user.standups.create } }
      it      { is_expected.to be_valid }
    end
  end

  describe "item sorting" do
    before do
      @standup = @user.standups.create!

      @first_item = @standup.items.create!(:content => "An item", :today => true)
      Timecop.travel(3.minute.from_now) do
        @second_item = @standup.items.create!(:content => "Another item", :today => true) 
      end
      @third_item = @standup.items.create!(:content => "Yet another item", :today => false)
    end

    subject { @standup.items.to_a }
    it      { is_expected.to eql([@first_item, @third_item, @second_item]) }
  end
end
