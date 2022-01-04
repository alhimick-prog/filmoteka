Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :films do
    member do
      resources :seasons
    end
  end
  resources :categories
  resources :countries
  resources :genres
  resources :people
  resources :tags
end
