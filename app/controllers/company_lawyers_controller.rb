class CompanyLawyersController < ApplicationController
  def edit
    company = Company.find(params[:company_id])
    lawyers = Lawyer.order(:name)

    render locals: { company: company, lawyers: lawyers}
  end

  def update
    company_lawyers = CompanyLawyers.new(params[:company_id], params[:company][:lawyer_ids])
    company_lawyers.save

    redirect_to company_path(company_lawyers.company)
  end
end
