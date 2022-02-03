# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # get 'user/index', to: 'user#index', as: 'root'
  get '/likes/create(.:format)', to: 'likes#create', as: 'create_like'
  post '/comments/create', to: 'comments#create', as: 'create_comment'
  root 'user#index'
  resources :user, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end 
  
  resources :posts, only: %i[new create] do
    resources :comments
    resources :likes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
