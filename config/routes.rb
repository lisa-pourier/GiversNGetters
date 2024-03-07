Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :requests, only: [:index, :new, :create, :show]
  get '/requests', to: 'requests#index'
  get 'search', to: 'pages#search'

  resources :users, only: [:index, :show, :edit, :update]
  get '/users', to: 'users#index'
  get '/users/id', to: 'users#show'
  get '/profile', to: 'users#profile', as: 'user_profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_user_profile'
end
