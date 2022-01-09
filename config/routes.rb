Rails.application.routes.draw do
  devise_scope :user do
    devise_for :users
    get 'profile', to: 'devise/registrations#edit'
  end
  root "home#index"
  resources :films
  resources :categories
  resources :countries
  resources :genres
  resources :people
  resources :tags
  resources :seasons
  resources :episodes
  resources :comments
  resources :watch_items, only: %i(create destroy update)
end
