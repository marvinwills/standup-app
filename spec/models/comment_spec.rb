require "rails_helper"

RSpec.describe Comment, :type => :model do

  it { is_expected.to have_db_column(:text).of_type(:text) }
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  it { is_expected.to have_db_column(:standup_id).of_type(:integer) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:standup) }

  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:standup) }
  it { is_expected.to validate_presence_of(:text) }

end
