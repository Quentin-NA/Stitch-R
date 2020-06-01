require "sidekiq/web"

Rails.application.routes.draw do

  # Sidekiq Web UI, only for admins.

  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index]
  resources :receipts, only: [:index]
  resources :receivers, only: [:index, :new, :create, :destroy]
  resources :supplier_searches, only: [:index, :show, :new, :create]

  get "/dashboard", to: "pages#dashboard"
  get "/profil", to: "pages#profil"
  get "/history", to: "pages#history"

end
