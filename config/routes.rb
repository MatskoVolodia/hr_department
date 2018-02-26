Rails.application.routes.draw do
  resources :user_groups
  resources :users, only: %i[index]
  devise_for :users
end
