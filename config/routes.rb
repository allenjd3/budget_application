Rails.application.routes.draw do
  resources :csv_uploaders
  resources :months, only: [:new, :create, :update, :destroy]
  resources :paychecks
  resources :transactions, only: [:create, :update, :destroy]
  resources :items, only: [:create, :update, :destroy]
  resources :categories, only: [:create, :update, :destroy]
  devise_for :users 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/category_items', to: 'category_item#index'
  post '/add_transactions', to: 'csv_uploaders#add_transactions', as: 'add_transactions'
  get '/month/:month/year/:year', to: 'category_item#month', as: 'get_month'
  get '/cp', to: 'category_item#cp', as: 'control_panel'
  match '/search-month', to: 'category_item#search', via: :post
  root to: 'home#index'
end
