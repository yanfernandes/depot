Rails.application.routes.draw do
  resources :carts
  root "store#index", as: "store_index"
  resources :products
  get "up" => "rails/health#show", as: :rails_health_check

  # root "posts#index"
end
