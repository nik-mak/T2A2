Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'projects#index'

  # Project Paths
  get 'projects', to: 'projects#index'
  get 'projects/new', to: 'projects#new'
  get 'projects/:id', to: 'projects#show', as: 'project'
  get 'projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  post 'projects', to: 'projects#create'
  patch 'projects/:id', to: 'projects#update'
  delete 'projects/:id', to: 'projects#destroy'

  # User Paths
  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  post 'users', to: 'users#create'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  
end
