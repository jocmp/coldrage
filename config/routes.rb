Rails.application.routes.draw do
  root "playlists#index"

  resources :playlists, only: [:index, :show]

  resources :sessions, only: [] do
    collection do
      get :auth_spotify
      get :spotify_callback
    end
  end

  get "/auth/spotify/callback", to: "sessions#spotify_callback"
end
