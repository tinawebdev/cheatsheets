Rails.application.routes.draw do
  devise_for :users
  root "cheatsheets#index"

  resources :users, only: [:show, :edit, :update]
end
