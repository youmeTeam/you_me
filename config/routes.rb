Rails.application.routes.draw do

  root to: 'user_sessions#index'
  resources :user_sessions, only: [:index, :new, :create, :destroy]
  resources :users do
    member do
      get :activate
    end
  end
  resources :dreams, only: :index
  resources :activation, only: :index
end
