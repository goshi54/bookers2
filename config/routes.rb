Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :books do
     resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users
  get '/home/about' => 'homes#about'
  end
