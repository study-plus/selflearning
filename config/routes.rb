Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
