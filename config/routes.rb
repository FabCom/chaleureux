Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/presentation'
  get 'pages/contact'
  
  resources :profiles

  root 'pages#index'
  resources :orders, only: [:show, :new, :create]
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :delete]

  devise_for :users
  resources :carts
  resources :join_table_item_carts

  get '*path' => redirect('/404.html')
end
