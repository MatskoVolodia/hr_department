Rails.application.routes.draw do
  resources :posts
  resources :user_groups
  resources :users do
    member do
      patch :add_to_user_group
    end
  end
  devise_for :users
end
