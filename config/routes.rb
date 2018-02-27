Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :user_groups

  resources :posts do
    resources :user_groups, only: %i[index]
  end

  resources :users do
    resources :user_groups, only: %i[index]
  end
end
