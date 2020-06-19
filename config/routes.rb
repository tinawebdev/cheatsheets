Rails.application.routes.draw do    
  devise_for :users
  root "pages#home"

  resources :users
  resources :cheatsheets do
    resources :likes, only: [:create, :destroy]
  end
  resources :favorites, only: [:index, :create, :destroy]
  resources :tags, only: [:show] do
    resources :subscriptions, only: [:create, :destroy]
  end
end
