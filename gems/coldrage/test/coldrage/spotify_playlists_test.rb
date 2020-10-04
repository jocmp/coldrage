require "test_helper"
require 'ostruct'

class SpotifyPlaylistsTest < Minitest::Test
  def make_repository
    repository = Minitest::Mock.new
    Coldrage.spotify_playlists = repository
    repository
  end

  def test_search

  end

  def test_create
    repository = make_repository
    spotify_id = "my_id_123"
    repository.expect(:create, nil, [spotify_id: spotify_id])

    Coldrage::SpotifyPlaylists.create(spotify_id: spotify_id)

    repository.verify
  end

  def test_snapshot
    spotify_id = "my_id_123"
    playlist = OpenStruct.new(id: spotify_id)
    spotify_client = Minitest::Mock.new

    repository = make_repository

    repository.expect(:snapshot, nil, [playlist: playist])

    Coldrage::SpotifyPlaylists.create(spotify_id: spotify_id)

    repository.verify
  end
end
