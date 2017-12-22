Rails.application.routes.draw do
  devise_for :users
  resources :streams
  resources :stats
  resources :artists
  resources :scores
  resources :genres
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
