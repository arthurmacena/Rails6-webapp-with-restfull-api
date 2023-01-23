require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'Migrations' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }
    it { is_expected.to have_db_column(:role).of_type(:integer) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'presence validations' do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "uniqueness validations" do
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe "enum validations" do
    it { should define_enum_for(:role).with_values(%i[user admin]) }
    it { should define_enum_for(:status).with_values(%i[active inactive]) }
  end
end
