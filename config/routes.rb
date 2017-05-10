Rails.application.routes.draw do
  root 'static#home'

  resources :users
  resources :attractions

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/signout', to: "sessions#destroy"

  post '/rides/new', to: "rides#new"
end
