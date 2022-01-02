Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :films
  resources :categories
  resources :countries
  resoursec :genres
end
