Rails.application.routes.draw do

  root 'welcome#home'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  get '/signout',  to: 'sessions#destroy'
  resources :users
  resources :attractions
  post 'rides/new', to: 'rides#new'
end
