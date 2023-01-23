# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  # Defines the root path route ("/")
  root "home#index"

  mount Basicapi::API => '/'
  mount GrapeSwaggerRails::Engine => '/api/swagger'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users, path: 'devise_users', controllers: {
    sessions: 'devise_users/sessions',
    registrations: 'devise_users/registrations'
  }

  resources :users do
    resources :activate, only: [:create], controller: 'users/activate'
    resources :inactivate, only: [:create], controller: 'users/inactivate'
  end
end
