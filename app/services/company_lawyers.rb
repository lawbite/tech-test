class CompanyLawyers
  attr_reader :company, :lawyer_ids

  def initialize(company_id, lawyer_ids)
    @company = Company.find(company_id)
    @lawyer_ids = lawyer_ids
  end

  def save
    company.update(lawyer_ids: lawyer_ids)
  end

  def errors
    company.errors.full_messages
  end
end
