Rails.application.routes.draw do
  root to: 'user_sessions#index'
  resources :user_sessions, only: [:index, :new, :create, :destroy]
  resources :users
  resources :dreams, only: :index
end
