require "rails_helper"

RSpec.describe CompanyLawyers do
  let(:company) { FactoryBot.create(:company) }
  let(:lawyer1) { FactoryBot.create(:lawyer) }
  let(:lawyer2) { FactoryBot.create(:lawyer) }
  let(:lawyer3) { FactoryBot.create(:lawyer) }

  it "can add lawyers to a company" do
    instance = described_class.new(company.id.to_s, [lawyer1.id.to_s])
    expect(instance.save).to be(true)
    expect(company.lawyers).to eq([lawyer1])
  end

  it "can add 2 lawyers to a company" do
    instance = described_class.new(company.id.to_s, [lawyer1.id.to_s, lawyer2.id.to_s])
    expect(instance.save).to be(true)
    expect(company.lawyers).to eq([lawyer1, lawyer2])
  end

  it "can change the lawyers on a company" do
    company.lawyers << lawyer1 << lawyer2
    instance = described_class.new(company.id.to_s, [lawyer1.id.to_s, lawyer3.id.to_s])
    expect(instance.save).to be(true)
    expect(company.reload.lawyers).to eq([lawyer1, lawyer3])
  end

  it "can remove all lawyers on a company" do
    company.lawyers << lawyer1
    instance = described_class.new(company.id.to_s, [""])
    expect(instance.save).to be(true)
    expect(company.reload.lawyers).to eq([])
  end
end
