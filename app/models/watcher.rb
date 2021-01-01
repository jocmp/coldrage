class Watcher < ApplicationRecord
  belongs_to :user
  has_many :backups, dependent: :destroy

  validates :playlist_id, uniqueness: { scope: :user_id }

  def playlist_id=(playlist_id)
    super(playlist_id.split(":").last)
  end

  def playlist
    @playlist ||= RSpotify::Playlist.find_by_id(playlist_id)
  end
end
