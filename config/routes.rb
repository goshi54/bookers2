Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root to: 'homes#top'
  resources :books do
     resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get '/search', to: 'searchs#search'

  resources :users
  get '/home/about' => 'homes#about'
  end
