Rails.application.routes.draw do
  resources :exercise_records
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'homepage#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define routes for resources
  resources :workouts
  resources :exercises
  resources :plans

  # Define routes for reviews
  resources :reviews, only: [:new, :create]

  # Define routes for sessions (login/logout)
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  # Define routes for users (signup)
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end
