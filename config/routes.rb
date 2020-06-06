Rails.application.routes.draw do
  resources :months
  resources :paychecks
  resources :transactions
  resources :items
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/category_items", to: "category_item#index"
  get "/month/:month/year/:year", to: "category_item#month", as: "get_month"
  get "/cp", to: "category_item#cp", as: "control_panel"
  match "/search-month", to: "category_item#search", via: :post
  root to: "home#index"
end
