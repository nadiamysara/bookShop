Rails.application.routes.draw do
  resources :genres do
    get :search, on: :collection
  end
  resources :users, only: [:index, :destroy] do
    collection do
      get :editRecord
      patch :updateRecord
      put :updateRecord
    end
  end
  resources :payments do
    post :redirect
  end
  require 'repost'
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :book_users do
    get :return_book, on: :member
    get :void_fee, on: :member
    get :extend_due, on: :member
    resources :payments, shallow: true do
      post :redirect
    end
  end
  resources :authors
  resources :books do
    get :rent , on: :member
    get :search, on: :collection
  end
  # can't find users/sign_out thus create new route https://github.com/heartcombo/devise#configuring-controllers
  devise_scope :user do
    get 'signout', to: 'devise/sessions#destroy'
  end
  devise_for :users
  root to: 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
