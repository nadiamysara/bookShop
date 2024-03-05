Rails.application.routes.draw do
  #get 'book_user/create'
  #get 'book_user/update'
  #get 'book_user/:id/update', to: 'book_user#edit'
  #get 'book_user', action: :index, controller: 'book_user', as: :rent
  #get 'book_user', to: 'book_user#index', as: 'rent'
  resources :authors
  #devise_for :authors
  #devise_for :books
  resources :books do
    get :rent , on: :member
  end
  #get 'books/:id', to: 'books#new_rent' , as: :new_rent
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
  #get 'books', to: 'books#index'
  #get 'books/:id', to: 'books#show'
  devise_for :users
  root to: 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
