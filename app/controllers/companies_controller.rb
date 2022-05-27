class CompaniesController < ApplicationController
  def index
    companies = Company.all
    render locals: { companies: companies }
  end

  def show
    company = Company.find params[:id]
    render locals: { company: company }
  end
end
