
Rails.configuration.coldrage = {
  spotify_client_id: ENV['SPOTIFY_CLIENT_ID'],
  spotify_client_secret: ENV['SPOTIFY_CLIENT_SECRET'],
}

Coldrage.authenticate(
  id: Rails.configuration.coldrage[:spotify_client_id],
  secret: Rails.configuration.coldrage[:spotify_client_secret]
)
