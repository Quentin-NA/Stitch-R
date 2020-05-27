Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:index] do
    resources :receipts, only: [:index]
    resources :receivers, only: [:index]
    resources :supplier_searches, only: [:index, :new, :create]
  end

  devise_for :users, 
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
