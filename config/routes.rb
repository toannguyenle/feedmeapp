Feedmeapp::Application.routes.draw do
  # Root Routing
  root 'application#index'
  # Rerouting everything else to index page
  get '*path' => 'application#index'
  # API ROUTES
  scope 'api', defaults: {format: :json} do
    # resources :orders, only: [:index, :create, :update, :destroy]
    # resources :restaurants, only: [:index, :create, :update, :destroy]
    # resources :products, only: [:index, :create, :update, :destroy]
    # resources :users, only: [:index, :create, :update, :destroy]
    # resources :delivery, only: [:index, :create, :update, :destroy]
    # resources :detail, only: [:index, :create, :update, :destroy]
    # resources :payment, only: [:index, :create, :update, :destroy]
  end

  # Restaurants Routes
  get 'restaurants/' => 'restaurants#index'
  get 'restaurants/new' => 'restaurants#new', as: :new_restaurant
  get 'restaurants/:id' => 'restaurants#show', as: :restaurant
  post 'restaurants/' => 'restaurants#create'
  get 'restaurants/:id/edit' => 'restaurants#edit', as: :edit_restaurant
  patch 'restaurants/:id' => 'restaurants#update'
  delete 'restaurants/:id' => 'restaurants#destroy'
  
  # Products Routes
  get 'products/' => 'products#index'
  get 'products/new' => 'products#new', as: :new_product
  get 'products/:id' => 'products#show', as: :product
  post 'products/' => 'products#create'
  get 'products/:id/edit' => 'products#edit', as: :edit_product
  patch 'products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'

  # User Routes
  get 'users/' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  post 'users/' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  # Order Routes
  get 'orders/' => 'orders#index'
  get 'orders/new' => 'orders#new', as: :new_order
  get 'orders/:id' => 'orders#show', as: :order
  post 'orders/' => 'orders#create'
  get 'orders/:id/edit' => 'orders#edit', as: :edit_order
  patch 'orders/:id' => 'orders#update'
  delete 'orders/:id' => 'orders#destroy'
  
end
