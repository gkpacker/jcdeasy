Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  get "/panels/:id/available_dates/", to: "panels#available", as: "available"
  resource :users, only: [:show] do
    resources :companies, only: [:new, :create]
  end
  resources :campaigns, only: [:show, :new, :create]
  resources :companies, only: [:show, :edit, :update, :destroy]
  resources :panels, only: [:index, :show] do
    resources :orders, only: :create
  end
  resources :orders, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
