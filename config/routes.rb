Rails.application.routes.draw do
  resources :lawyers, only: :index
  resources :companies, only: :index
  root "companies#index"
end
