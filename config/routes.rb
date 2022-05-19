Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'projects#index'

  # Project Paths
  get 'projects', to: 'projects#index'
  get 'projects/new', to: 'projects#new'
  get 'projects/:id', to: 'projects#show', as: 'project'
  get 'projects/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch 'projects/:id/join', to: 'projects#join', as: 'join_project'
  patch 'projects/:id/leave', to: 'projects#leave', as: 'leave_project'
  post 'projects', to: 'projects#create'
  patch 'projects/:id', to: 'projects#update'
  delete 'projects/:id', to: 'projects#destroy'

  # User Paths
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch 'users/:id', to: 'users#update'

  # Skill Paths
  get 'skills', to: 'skills#index'
  get 'skills/new', to: 'skills#new'
  get 'skills/:id', to: 'skills#show', as: 'skill'
  post 'skills', to: 'skills#create'
end
