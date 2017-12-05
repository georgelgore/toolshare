Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :reservations, only: [:index, :show, :new, :create, :edit, :update]
  resources :reviews, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  resources :tool_types, only: [:index, :show]

  get "/", to: "root#welcome"


end
