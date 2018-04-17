Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  get "/panels/:id/available_dates/", to: "panels#available", as: "available"

  patch "/campaigns/:id/paid", to: "campaigns#paid", as: "payment"

  resource :users, only: [:show]

  resources :campaigns, only: [:show, :new, :create, :edit, :update]

  resources :companies, only: [:show, :new, :create, :edit, :update, :destroy]

  resources :panels, only: [:index, :show] do
    resources :orders, only: :create
  end

  resources :orders, only: [:destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
