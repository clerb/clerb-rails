Rails.application.routes.draw do
  root "pages#home"

  resources :events, only: %i[index show]
  resources :companies, only: [:index, :new, :create]
end
