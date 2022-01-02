Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :films
  resources :categories
  resources :countries
  resources :genres
  resources :people
  resources :tags
end
