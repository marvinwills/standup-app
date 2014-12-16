require "rails_helper"

RSpec.describe Item, :type => :model do

  let(:item) { Item.create({:content => "some content", :today => true}) }

  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:today).of_type(:boolean) }

  it { is_expected.to belong_to(:standup) }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to ensure_length_of(:content).is_at_least(5) }
  it { is_expected.to validate_inclusion_of(:today).in_array([true, false]) }

end
