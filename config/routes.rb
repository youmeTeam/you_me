Rails.application.routes.draw do
  root to: 'users#index'
  resources :user_sessions
  resources :users
end
