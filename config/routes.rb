Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:index] do
    resources :receipts, only: [:index]
    resources :receivers, only: [:index, :new, :create]
    resources :supplier_searches, only: [:index, :new, :create]
  end

  get "/dashboard", to: "pages#dashboard"
  get "/profil", to: "pages#profil"


end
