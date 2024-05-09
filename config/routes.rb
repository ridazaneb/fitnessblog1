Rails.application.routes.draw do
  get 'sessions/new'
  get 'homepage/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :workouts
  resources :exercises
  get 'login', to: 'sessions#new'  
  get 'signup', to: 'registrations#new'   

  # Defines the root path route ("/")
  # root "posts#index"
end
