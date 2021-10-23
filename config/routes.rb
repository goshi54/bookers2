Rails.application.routes.draw do
  get 'users/show'
  resources :books
  devise_for :users
  root to: 'homes#top'
  end
