Rails.application.routes.draw do
  root "pages#home"

  get "/inventory", to: "pages#shop", as: :shop
  resources :line_items, only: [:new, :create]

  get "/checkout", to: "checkout#show", as: :checkout
  patch "/checkout/submit", to: "checkout#submit", as: :submit_order

  namespace :admin do
    root to: "flavors#index"

    resources :users
    resources :orders
    resources :flavors
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
