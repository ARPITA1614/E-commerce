# Rails.application.routes.draw do
# #   NoMethodError
# # undefined method 'to_sym' for an instance of Hash
# # Did you mean?
# # to_s
# # to_set    therefore **

#   devise_for :users, **ActiveAdmin::Devise.config, controllers: {
#     sessions: 'users/sessions',
#     registrations: 'users/registrations'
#   }

#   #   devise_for :users, ActiveAdmin::Devise.config.merge(
#   #   controllers: {
#   #     sessions: 'users/sessions',
#   #     registrations: 'users/registrations'
#   #   }
#   # )
#   ActiveAdmin.routes(self)
#   resources :products
#   # devise_for :users, controllers: {
#   #   sessions: 'users/sessions',
#   #   registrations: 'users/registrations'
#   # }
#   get "up" => "rails/health#show", as: :rails_health_check
#   root "home#index"
# end
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

end
