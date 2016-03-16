Rails.application.routes.draw do

  root to: 'user_sessions#index'
  resources :user_sessions, only: [:index, :new, :create, :destroy]
  resources :users do
    member do
      get :activate
      put :confirm
    end
  end
  resources :dreams, only: :index
  resources :activation, only: :index
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :sent_password_resets, only: :index
end
