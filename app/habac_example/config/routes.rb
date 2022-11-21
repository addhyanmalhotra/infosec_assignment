Rails.application.routes.draw do
  resources :auth_rules
  resources :environment_state_attributes
  resources :environment_states
  resources :operation_attributes
  resources :operations
  resources :device_attributes
  resources :devices
  resources :user_attributes
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
