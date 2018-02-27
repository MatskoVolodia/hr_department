Rails.application.routes.draw do
  resources :user_groups

  resources :posts do
    resources :user_groups, only: %i[index]
  end

  resources :users do
    resources :user_groups, only: %i[index]
  end

  devise_for :users
end
