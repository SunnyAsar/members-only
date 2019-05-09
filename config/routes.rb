# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'users#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
