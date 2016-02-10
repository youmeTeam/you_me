Rails.application.routes.draw do
  root to: 'user_sessions#index'
  resources :user_sessions
  resources :users
  resources :dreams, only: :index
end
