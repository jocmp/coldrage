Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'playlists#index'

  resources :playlists, only: [:index, :show] do
    member do
      post :backup
    end
  end
end
