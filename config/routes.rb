Rails.application.routes.draw do
  resources :user_groups
  resources :users
  devise_for :users
end
