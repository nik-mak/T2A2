Rails.application.routes.draw do
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
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  # Skill Paths
  get 'skills', to: 'skills#index'
  get 'skills/new', to: 'skills#new'
  get 'skills/:id', to: 'skills#show', as: 'skill'
  get 'skills/:id/edit', to: 'skills#edit', as: 'edit_skill'
  post 'skills', to: 'skills#create'
  patch 'skills/:id', to: 'skills#update'
  delete 'skills/:id', to: 'skills#destroy'
end
