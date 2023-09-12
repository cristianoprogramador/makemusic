Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
  resources :products, only: [:show]

  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]

end
