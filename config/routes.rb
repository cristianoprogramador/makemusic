Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get 'home/index'
  get 'profile', to: 'users#show', as: 'user_profile'
  get 'search', to: 'home#search', as: 'search'

  root 'home#index'
  resources :products, only: [:show]
  resources :orders, only: [:index, :create]

  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy] do
    post 'increment', on: :member
    post 'decrement', on: :member
  end
end
