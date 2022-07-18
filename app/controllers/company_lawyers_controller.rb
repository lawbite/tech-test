class CompanyLawyersController < ApplicationController
  def edit
    company = Company.find(params[:company_id])
    lawyers = Lawyer.order(:name)

    render locals: { company: company, lawyers: lawyers}
  end

  def update
    company = Company.find(params[:company_id])
    company.update(company_params)
    redirect_to company_path(company)
  end

  private

  def company_params
    params.require(:company).permit(lawyer_ids: [])
  end
end
