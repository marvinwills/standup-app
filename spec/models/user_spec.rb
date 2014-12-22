require "rails_helper"

RSpec.describe User, :type => :model do

  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:username).of_type(:string) }
  it { is_expected.to have_db_column(:avatar).of_type(:string) }

  #devise columns
  it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
  it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:sign_in_count).of_type(:integer) }
  it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:inet) }
  it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:inet) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  it { is_expected.to have_many(:standups).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to ensure_length_of(:username).is_at_least(5) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to ensure_length_of(:password).is_at_least(8) }

  describe "sorting standups" do
    before do
      @user = User.create!(:email => "test@test.test", 
                           :username => "testusername",
                           :password => "testpassword")

      @first_standup = @user.standups.create!
      Timecop.travel(1.day.from_now) { @second_standup = @user.standups.create! }
      Timecop.travel(2.day.from_now) { @third_standup = @user.standups.create! }
    end

    subject { @user.standups.to_a }
    it      { is_expected.to eql([@third_standup, @second_standup, @first_standup]) }
  end
end

