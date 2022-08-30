Rails.application.routes.draw do
  resources :gyms, only: [:index, :show, :destroy]
  resources :memberships, only: [:index, :create]
  resources :clients , only: [:index, :show]
end
