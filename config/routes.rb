Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home
  resources :ecommerce

  resources :user_products
  resources :products do
      resources :user_products
  end
  root :to => "home#index"

  post "ecommerce/product_like"
  post "ecommerce/destroy_product_like"

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
root :to => "users#new"
resources :users
resources :sessions
end
