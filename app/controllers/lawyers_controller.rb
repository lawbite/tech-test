class LawyersController < ApplicationController
  def index
    lawyers = Lawyer.all
    render locals: { lawyers: lawyers }
  end
end
