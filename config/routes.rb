Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: redirect('/admin')

  # namespace :admin do
  #   # Add dashboard for your models here
  #   resources :users
  #   resources :skills
  #   resources :users_skills
  #   resources :experiences
  #   root to: 'users#index'
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
