class CompanyLawyersController < ApplicationController
  def edit
    company = Company.find(params[:company_id])
    lawyers = Lawyer.order(:name)

    render locals: { company: company, lawyers: lawyers}
  end
end
