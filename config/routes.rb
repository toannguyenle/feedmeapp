Feedmeapp::Application.routes.draw do
  # For Authentication
  root 'home#index'

  # Rerouting everything else to index page
  # get '*path' => 'application#index'

  #added for Authentication
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  # Order Product Path
  get 'orderproducts/:id' => 'orderproducts#show', as: :orderproduct
  get 'orderproducts/:id/edit' => 'orderproducts#edit', as: :edit_orderproduct
  patch 'orderproducts/:id' => 'orderproducts#update'
  delete 'orderproducts/:id' => 'orderproducts#destroy', as: :orderproducts
  # API ROUTES
  scope 'api', defaults: {format: :json} do
    get 'wdi/:api_key' => 'products#wdi'
  end
  # Restaurants Routes
  get 'restaurants/' => 'restaurants#index'

  get 'restaurants/:id/business_yelp' => 'restaurants#business_yelp', as: :yelp
  post 'restaurants/:id' => 'restaurants#claim_business', as: :claim_business

  get 'restaurants/new' => 'restaurants#new', as: :new_restaurant
  get 'restaurants/:id' => 'restaurants#show', as: :restaurant
  post 'restaurants/' => 'restaurants#create'
  get 'restaurants/:id/edit' => 'restaurants#edit', as: :edit_restaurant
  patch 'restaurants/:id' => 'restaurants#update'
  delete 'restaurants/:id' => 'restaurants#destroy'
  
  # Products Routes
  get 'products/' => 'products#index'
  # get 'products/:ordrin' => 'products#ordrin_search', as: 'ordrin_search'
  get 'products/new' => 'products#new', as: :new_product
  get 'products/:id' => 'products#show', as: :product
  post 'products/' => 'products#create'
  get 'products/:id/edit' => 'products#edit', as: :edit_product
  patch 'products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'

  # User Routes
  get 'users/' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/new_business' => 'users#new_business', as: :new_business
  get 'users/:id' => 'users#show', as: :user
  post 'users/' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'

  # Order Routes
  get 'orders/' => 'orders#index'
  get 'orders/new' => 'orders#new', as: :new_order
  # Custom routes
  get 'orders/confirmation/:id' => 'orders#confirmation', as: :order_confirmation
  get 'orders/:id' => 'orders#complete_order', as: :complete_order 
  #Additional routes for creating new order
  post 'orders/new' => 'orders#add_to_current_order', as: :add_to_current_order 
  get 'orders/:id' => 'orders#show', as: :order
  post 'orders/' => 'orders#create'
  get 'orders/:id/edit' => 'orders#edit', as: :edit_order
  patch 'orders/:id' => 'orders#update'
  delete 'orders/:id' => 'orders#destroy'

  # Payment Routes
  get 'payments/' => 'payments#index'
  get 'payments/new' => 'payments#new', as: :new_payment
  get 'payments/:id' => 'payments#show', as: :payment
  post 'payments/' => 'payments#create'
  get 'payments/:id/edit' => 'payments#edit', as: :edit_payment
  patch 'payments/:id' => 'payments#update'
  delete 'payments/:id' => 'payments#destroy'
  
end
