Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "home#index"

  devise_for :users
  resources :users do
    resources :activate, only: [:create], controller: 'users/activate'
    resources :inactivate, only: [:create], controller: 'users/inactivate'
  end
end
