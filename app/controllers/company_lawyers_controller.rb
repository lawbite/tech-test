class CompanyLawyersController < ApplicationController
  def edit
    company = Company.find(params[:company_id])

    render locals: { company: company, errors: nil }
  end

  def update
    company_lawyers = CompanyLawyers.new(params[:company_id], params[:company][:lawyer_ids])
    if company_lawyers.save
      redirect_to company_path(company_lawyers.company)
    else
      render :edit, locals: { company: company_lawyers.company, errors: company_lawyers.errors }
    end
  end
end
