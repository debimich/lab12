Rails.application.routes.draw do
  resources :sessions, only: %i[ new create ]
  get 'sqrt/input'
  get 'sqrt/view'

  get 'sessions/destroy', to: 'sessions#destroy'
  delete 'sessions/destroy', to: 'sessions#destroy'

  resources :users

  post 'sqrt/view' => 'sqrt#view'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'sqrt#input'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
