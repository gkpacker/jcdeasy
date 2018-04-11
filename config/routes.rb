Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  get "/panels/:id/available_dates/", to: "panels#available", as: "available"
  resource :users, only: [:show] do
    resources :companies, only: [:new, :create]
  end
  resources :campaigns, only: [:show]
  resources :companies, only: [:show, :edit, :update, :destroy] do
    resources :campaigns, only: [:new, :create]
  end
  resources :panels, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
