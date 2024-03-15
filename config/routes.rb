Rails.application.routes.draw do
  resources :payments do
    post :redirect
  end
  require 'repost'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :book_users
  resources :authors
  resources :books do
    get :rent , on: :member
  end
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
  devise_for :users
  root to: 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
