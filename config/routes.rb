Rails.application.routes.draw do
  resources :posts
  resources :user_groups
  resources :users
  devise_for :users
end
