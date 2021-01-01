Rails.application.routes.draw do
  root "playlists#index"

  resources :playlists, only: [:index, :show]
  resources :sessions, only: [:create, :destroy]

  get "/auth/:provider/callback", to: "sessions#create"
  post "logout", to: "sessions#destroy"
end
