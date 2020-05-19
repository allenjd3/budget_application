Rails.application.routes.draw do
  resources :items
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/category_items", to: "category_item#index"
  root to: "home#index"
end
