Rails.application.routes.draw do
  resources :album_streams
  resources :album_artists
  resources :album_genres
  resources :streams
  resources :stats
  resources :artists
  resources :scores
  resources :genres
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
