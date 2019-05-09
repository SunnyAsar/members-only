# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/new'
  # get 'posts/create'
  root to: 'users#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :posts
end
