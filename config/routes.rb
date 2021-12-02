Rails.application.routes.draw do
  get 'item_pictures/create'
  get 'pages/index'
  get 'pages/presentation'
  get 'pages/contact'
  
  resources :profiles

  root 'pages#index'
  resources :orders, only: [:show, :new, :create]
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  devise_for :users
  resources :carts
  resources :join_table_item_carts
  resources :items, only: [:show] do
    resources :item_pictures, only: [:create]
  end

  # get '*path' => redirect('/404.html')
end
