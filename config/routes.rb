# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'user/index', to: 'user#index', as: 'root'
  root 'user#index'
  resources :user, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
