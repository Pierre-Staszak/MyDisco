Rails.application.routes.draw do
  devise_for :users
  resources :streams
  resources :stats
  resources :artists
  resources :scores
  resources :genres
  resources :albums
  resources :discogs_wrapper do
    collection do
      get :authenticate
      get :callback
      get :try
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #

end
