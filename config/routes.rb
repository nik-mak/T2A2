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

  # Skill Paths
  get 'skills', to: 'skills#index'
  get 'skills/:id', to: 'skills#show', as: 'skill'

end
