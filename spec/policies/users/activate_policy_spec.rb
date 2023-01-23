require 'rails_helper'

RSpec.describe Users::ActivatePolicy, type: :policy do
  subject { described_class.new(user, user) }

  context "being an admin" do
    let(:user) { FactoryBot.create(:user_admin) }

    it { is_expected.to permit_actions(%i[create]) }
  end

  context "being an user" do
    let(:user) { FactoryBot.create(:user_normal) }

    it { is_expected.to forbid_actions(%i[create]) }
  end
end
