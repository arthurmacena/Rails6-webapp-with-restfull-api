# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"

  mount Basicapi::API => '/'
  mount GrapeSwaggerRails::Engine => '/api/swagger'
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users
  resources :users do
    resources :activate, only: [:create], controller: 'users/activate'
    resources :inactivate, only: [:create], controller: 'users/inactivate'
  end
end
