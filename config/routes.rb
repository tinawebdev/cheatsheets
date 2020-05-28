Rails.application.routes.draw do
  devise_for :users
  root "cheatsheets#index"

  resources :users
  resources :cheatsheets
end
