Rails.application.routes.draw do
  resources :playlists
  resources :backups
  get 'watchers/create'
  get 'watchers/show'
  get 'watchers/edit'
  root "playlists#index"

  resources :playlists, only: [:index, :show]
  resources :watchers, only: [:index, :create, :new, :destroy] do
    resources :backups, only: [:index, :create]
  end
  resources :sessions, only: [:create, :destroy]
  resources :backups, only: [:show]

  get "/auth/:provider/callback", to: "sessions#create"
  post "logout", to: "sessions#destroy"
end
