Rails.application.routes.draw do
  get 'watchers/create'
  get 'watchers/show'
  get 'watchers/edit'
  root "playlists#index"

  resources :playlists, only: [:index, :show]
  resources :watchers, only: [:index, :create, :new, :destroy]
  resources :sessions, only: [:create, :destroy]

  get "/auth/:provider/callback", to: "sessions#create"
  post "logout", to: "sessions#destroy"
end
