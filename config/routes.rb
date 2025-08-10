Rails.application.routes.draw do
  root "pages#home"

  get "/inventory", to: "pages#shop", as: :shop

  namespace :admin do
    root to: "bottles#index"

    resources :bottles
    resources :users
    resources :orders
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
