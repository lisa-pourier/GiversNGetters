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
  get '/my_requests', to: 'requests#my_requests', as: 'my_requests'

  resources :agreements, only: [:index, :new, :create, :show]
  get '/dashboard', to: 'pages#dashboard'
  get '/agreements', to: 'agreements#new'
  get '/agreements', to: 'agreements#create'

  post '/agreements/:id/accept', to: 'agreements#accept', as: :accept_agreement
  post '/agreements/:id/reject',  to: 'agreements#reject', as: :reject_agreement
  # get '/dashboard', to: 'dashboard#show', as: 'dashboard' # to: 'agreements#show'
  resources :messages, only: [:index, :new, :create, :destroy, :show]
  post '/post_signup', to: 'post_signup#create', as: 'post_signup'
  get 'terms', to: 'pages#terms', as: :terms
  get 'privacy', to: 'pages#privacy', as: :privacy

  # get '/my_agreements', to: 'agreements#my_agreements', as: 'my_agreements'

end
