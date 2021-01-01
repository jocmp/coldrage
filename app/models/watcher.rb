class Watcher < ApplicationRecord
  belongs_to :user
  has_many :backups

  validates :playlist_id, uniqueness: { scope: :user_id }
end
