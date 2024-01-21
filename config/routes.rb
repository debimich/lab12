Rails.application.routes.draw do
  get 'definitions/new'
  get 'sessions/destroy', to: "sessions#destroy"
  get '/definitions/:definition_id', to: 'definitions#show'
  resources :sessions, only: %i[ new create ]

  resources :definitions, only: %i[ new create ]

  resources :values, only: %i[ create ]

  delete 'sessions/destroy', to: 'sessions#destroy'
  delete 'definitions/destroy', to: 'definitions#destroy'
  resource :value, only: %i[ destroy ]
  resources :users

  root to: "definitions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
