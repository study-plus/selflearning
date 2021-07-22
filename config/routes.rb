Rails.application.routes.draw do
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :checks, only: [:create]
  end

  resources :relationships, only: [:create, :destroy]

  devise_for :users
  resources :users, only: [:index, :show] do
    resources :events
  end
  # get '/users/index' => 'users#index', as: 'user_index'
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]

  # resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'top#index'
end
