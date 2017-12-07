Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :reservations, only: [:index, :show, :new, :create, :edit, :update]
  resources :reviews, only: [:index, :show, :create]
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  resources :tool_types, :path => "tool-types", only: [:index, :show]

  get "/", to: "root#welcome"
  get "signup", to: "users#new", as: "signup"
  get "/signin", to: "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy", as: "signout"

  get '/reservations/:id/review/new', to: 'reviews#new', as: 'review_new'


end
