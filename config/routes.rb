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
  resources :receipts, only: [:index, :update] do
    member do
      get :share
      get :dismiss
    end
  end
  resources :receivers, only: [:index, :new, :create, :destroy, :update] do
    collection do
      get :my_partners
    end
  end

  resources :supplier_searches, only: [:index, :show, :new, :create, :destroy] do
    member do
      get :share_all_receipts
      get :dismiss_all_receipts
    end
  end

  resources :supplier_searches_users, only: [:index] do
    member do
      get :subscribing
      get :not_subscribing
    end
  end

  # resources :supplier_searches_users, only: [:index] do
  # end

  get "/dashboard", to: "pages#dashboard"
  get "/profil", to: "pages#profil"
  # patch "/profil/update", to: "pages#update_profile"
  get "/history", to: "pages#history"
  get "/trash", to: "pages#trash"
  get '/mailbox_scanning', to: 'pages#mailbox_scanning'

end
