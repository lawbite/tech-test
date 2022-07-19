Rails.application.routes.draw do
  resources :lawyers, only: :index
  resources :companies, only: %i[index show] do
    # use single resource pattern here to get cleaner URLs
    resource :lawyers, only: [:edit, :update], controller: :company_lawyers
  end
  root "companies#index"
end
