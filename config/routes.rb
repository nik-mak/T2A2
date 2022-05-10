Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'projects#index'

  # Project Paths
  get 'projects', to: 'projects#index'
  get 'projects/:id', to: 'projects#show'

  # User Paths
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  
end
