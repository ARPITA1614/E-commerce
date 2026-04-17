Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  ActiveAdmin.routes(self)

  resources :products
  get "up" => "rails/health#show", as: :rails_health_check
  root "home#index"

  resource :carts, only: [:show]
  resources :items, only: [:create, :update, :destroy]
  # get "order", to: "orders#index", as: :order
  get "my_profile", to: "profiles#index", as: :profile
  # get "wishlist", to: "wishlists#index", as: :wishlist
  resources :orders, only: [:index, :show]
  resources :wishlists, only: [:index, :create, :destroy]
  post "checkout", to: "carts#checkout", as: :checkout
end
