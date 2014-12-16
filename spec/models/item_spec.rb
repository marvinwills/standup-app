require "rails_helper"

RSpec.describe Item, :type => :model do

  let(:item) { Item.create!( { :content => "some content", :today => true } ) }

  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:today).of_type(:boolean) }

  it { is_expected.to belong_to(:standup) }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to ensure_length_of(:content).is_at_least(5) }
  it { is_expected.to validate_inclusion_of(:today).in_array([true, false]) }

  describe "scopes" do

    before do

      @today_item_1 = Item.create!( { :content => "some content", :today => true } )
      @today_item_2 = Item.create!( { :content => "some content", :today => true } )
      @yesterday_item_1 = Item.create!( { :content => "some content", :today => false } )
      @yesterday_item_2 = Item.create!( { :content => "some content", :today => false } )

    end

    describe ".today_items" do

      it { expect(Item.today_items.to_a).to eq([@today_item_1, @today_item_2]) }

    end

    describe ".yesterday_items" do

      it { expect(Item.yesterday_items.to_a).to eq([@yesterday_item_1, @yesterday_item_2]) }

    end

  end

end
