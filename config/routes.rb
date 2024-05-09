Rails.application.routes.draw do
  get 'plans/new'
  get 'plans/create'
  get 'users/new'
  get 'users/create'
  get 'sessions/new'
  get 'homepage/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :workouts
  resources :exercises
  resources :plans

  resources :reviews, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  

  get '/plans/new', to: 'plans#new'
  post '/plans', to: 'plans#create'

  # Defines the root path route ("/")
  # root "posts#index"
end
