Rails.application.routes.draw do
  root to: 'pages#home'
  resources :receipts, only: [:index]
  devise_for :users, 
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
