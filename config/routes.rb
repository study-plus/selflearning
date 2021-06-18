Rails.application.routes.draw do
  resources :posts
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
