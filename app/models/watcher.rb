class Watcher < ApplicationRecord
  belongs_to :user
  has_many :backups, dependent: :destroy

  validates :playlist_id,
    uniqueness: {scope: :user_id, message: "You're already watching this playlist!"},
    format: {with: /\A[0-9A-Za-z]+\z/}

  def playlist
    @playlist ||= RSpotify::Playlist.find_by_id(playlist_id)
  end
end
