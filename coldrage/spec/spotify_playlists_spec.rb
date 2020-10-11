RSpec.describe Coldrage::SpotifyPlaylists do
  describe ".search" do
    let(:remote_playlists) { class_double(RSpotify::Playlist) }
    let(:playlists) { [instance_double(RSpotify::Playlist)] }
    let(:query) { 'test 123' }

    before do
      allow(remote_playlists).to receive(:search).with(query).and_return(playlists)
    end

    specify do
      expect(described_class.search(query: query, remote_playlists: remote_playlists)).to match_array(playlists)
    end
  end

  describe '.find' do
    let(:remote_playlists) { class_double(RSpotify::Playlist) }
    let(:playlist) { instance_double(RSpotify::Playlist) }
    let(:spotify_id) { "remote spotify id" }

    before do
      allow(remote_playlists).to receive(:find_by_id).with(spotify_id).and_return(playlist)
    end

    specify do
      expect(described_class.find(spotify_id: spotify_id, remote_playlists: remote_playlists)).to eq(playlist)
    end
  end

  describe ".create" do
    let(:repository) { double("spotify_playlists", create: nil) }
    let(:spotify_id) { "remote spotify id" }

    before { Coldrage.spotify_playlists = repository }

    specify do
      described_class.create(spotify_id: spotify_id)
      expect(repository).to have_received(:create).with(spotify_id: spotify_id)
    end
  end

  describe ".snapshot" do
    let(:repository) { double("spotify_playlists", create: nil) }
    let(:spotify_id) { "remote spotify id" }
    let(:playlist) { instance_double(RSpotify::Playlist) }
    let(:remote_playlists) { class_double(RSpotify::Playlist, find_by_id: playlist) }

    before { Coldrage.spotify_playlists = repository }

    specify do
      expect(repository).to receive(:snapshot).with(playlist: playlist)
      described_class.snapshot(spotify_id: spotify_id, remote_playlists: remote_playlists)
    end
  end
end
