Rails.application.routes.draw do
  resources :lawyers, only: :index
  resources :companies, only: %i[index show]
  root "companies#index"
end
