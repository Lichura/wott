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

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
end
