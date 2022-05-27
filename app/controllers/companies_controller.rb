class CompaniesController < ApplicationController
  def index
    companies = Company.all
    render locals: { companies: companies }
  end
end
