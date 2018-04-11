Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  get "/panels/:id/available_dates/", to: "panels#available", as: "available"
  resources :users, only: [:show] do
    resources :companies, only: [:index, :new, :create]
  end
  resources :companies, only: [:show, :edit, :update, :destroy]
  resources :panels, only: [:index, :show]
  resources :users, only: [:show]
  resources :companies, except: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
