require "rails_helper"

RSpec.describe Lawyer, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "can_be_associated_with" do
    let(:company) { FactoryBot.create(:company) }

    it "includes lawyers that are not associated with a company" do
      lawyer = FactoryBot.create(:lawyer)
      expect(described_class.can_be_associated_with(company)).to include(lawyer)
    end

    it "includes lawyers that are associated with the passed in company" do
      lawyer = FactoryBot.create(:lawyer, company: company)
      expect(described_class.can_be_associated_with(company)).to include(lawyer)
    end

    it "not to includes lawyers that are associated with a different company" do
      lawyer = FactoryBot.create(:lawyer, company: FactoryBot.create(:company))
      expect(described_class.can_be_associated_with(company)).not_to include(lawyer)
    end
  end
end
