Rails.application.routes.draw do
  namespace :api do
    get 'products/search'
  end
  
  namespace :admin do
    resources :categories
    resources :products
    resources :orders
  end
  
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  namespace :api do
    get 'products/search', to: 'products#search'
  end

  # resources :products, only: [:show]

  get 'admin/index', to: 'admin#index', as: :admin_index

  resources :categories, only: [:show]
end
