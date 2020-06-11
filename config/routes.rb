Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :users
  resources :cheatsheets
  resources :favorites, only: [:index, :create, :destroy]
  resources :tags, only: [:show]
end
